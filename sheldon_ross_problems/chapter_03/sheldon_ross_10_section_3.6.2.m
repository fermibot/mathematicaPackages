Module[{graphConnectedness},
  graphConnectedness =
      KeySort@Counts[Module[{nodes = Range@1000, graph},
        ConnectedGraphQ[
          Graph[# \[UndirectedEdge] RandomChoice[nodes] & /@ nodes]]
      ] & /@ Range[100]];
  BarChart[graphConnectedness,
    ChartLabels ->
        Placed[{Keys@graphConnectedness,
          Values@graphConnectedness}, {Below, Above}]]
]