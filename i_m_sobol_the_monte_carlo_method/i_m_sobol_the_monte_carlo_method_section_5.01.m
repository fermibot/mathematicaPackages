ClearAll[status, currentStatus];
status[list_List, time_] :=
    Boole[! Or @@ (Min[#] < time <= Max[#] & /@ list)]
currentStatus[list_List, time_] := ! Min[#] < time <= Max[#] &[
  Last[list]]

Module[{servers = 10, serverStatus, nCustomers = 100,
  arrivals, \[Lambda]a = 5, \[Lambda]s = 0.1, firstFree},
  arrivals =
      Accumulate[
        RandomVariate[ExponentialDistribution[\[Lambda]a], nCustomers]];
  serverStatus = ConstantArray[{{0, 0}}, servers];

  Quiet@Table[
    firstFree =
        First[Position[currentStatus[#, arrivals[[r]]] & /@ serverStatus,
          True]][[1]];
    If[Echo[firstFree] =!= Null,
      firstFree = First[firstFree][[1]];
      serverStatus[[firstFree]] =
          serverStatus[[firstFree]] ~
              Join ~ {{arrivals[[r]],
            arrivals[[r]] +
                RandomVariate[ExponentialDistribution[\[Lambda]s]]}};,
      Print["No server free"]]
    , {r, 1, Length@arrivals}];

  Print /@ serverStatus
]
