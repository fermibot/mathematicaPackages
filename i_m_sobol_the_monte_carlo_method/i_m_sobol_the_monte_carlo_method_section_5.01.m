ClearAll[status, currentStatus];
status[list_List, time_] :=
    Boole[Or @@ (Min[#] < time <= Max[#] & /@ list)]
currentStatus[list_List, time_] := ! Min[#] < time <= Max[#] &[
  Last[list]]

Module[{servers = 10, serverStatus, nCustomers = 120,
  arrivals, \[Lambda]a = 5, \[Lambda]s = #, firstFree, plot},
  arrivals =
      Accumulate[
        RandomVariate[ExponentialDistribution[\[Lambda]a], nCustomers]];
  serverStatus = ConstantArray[{{0, 0}}, servers];

  Quiet@Table[
    firstFree =
        First[Position[
          currentStatus[#, arrivals[[r]]] & /@ serverStatus,
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

  plot =
      Labeled[Framed@
          Column[MapThread[
            Plot[status[#1, r], {r, 1, 100}, Exclusions -> None,
              ExclusionsStyle -> Red, ImageSize -> 788,
              AspectRatio -> 0.1, Frame -> True,
              PlotRange -> {{0, Max@arrivals}, {0, 1.1}},
              PlotLabel -> "Server " <> #2, FrameTicks -> False,
              FrameLabel -> {None,
                Style["NotBusy-Busy", Bold]}] &, {serverStatus,
              ToString /@ Range[Length@serverStatus]}]],
        "\!\(\*SubscriptBox[\(\[Lambda]\), \(a\)]\) = " <>
            ToString[\[Lambda]a] <>
            " : \!\(\*SubscriptBox[\(\[Lambda]\), \(s\)]\) = " <>
            ToString[\[Lambda]s], Top];

  Export[
    StringReplace[NotebookFileName[],
      ".nb" ->
          "_rates_" <> ToString[\[Lambda]a] <> "_" <>
              ToString[\[Lambda]s] <> ".png"], plot, ImageSize -> 788,
    ImageResolution -> 1000]
] & /@ Range[0.1, 5, 0.1]
