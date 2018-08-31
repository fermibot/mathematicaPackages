ClearAll[status, currentStatus];
status[list_List, time_] :=
    Boole[Or @@ (Min[#] < time <= Max[#] & /@ list)]
currentStatus[list_List, time_] := ! Min[#] < time <= Max[#] &[
  Last[list]]

Module[{servers = 10, serverStatus, nCustomers = 120,
  arrivals, \[Lambda]a = 5, \[Lambda]s = 1, firstFree},
  arrivals =
      Accumulate[
        RandomVariate[ExponentialDistribution[\[Lambda]a], nCustomers]];
  serverStatus = ConstantArray[{{0, 0}}, servers];

  Quiet@Table[
    firstFree =
        First[Position[currentStatus[#, arrivals[[r]]] & /@ serverStatus,
          True]][[1]];
    If[firstFree =!= Null,
      firstFree = First[firstFree][[1]];
      serverStatus[[firstFree]] =
          serverStatus[[firstFree]] ~
              Join ~ {{arrivals[[r]],
            arrivals[[r]] +
                RandomVariate[ExponentialDistribution[\[Lambda]s]]}};,
      Print["No server free"]]
    , {r, 1, Length@arrivals}];

  Column[Plot[Evaluate[status[#, r]], {r, 1, 100}, Exclusions -> None,
    ExclusionsStyle -> Red, ImageSize -> 1200, AspectRatio -> 0.1,
    PlotRange -> {{0, Max@arrivals}, {0, 1.1}}] & /@ serverStatus]


]
