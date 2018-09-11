AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
<< lists`;
<< utilities`;

ListPlot[Module[{nNodes = Union @@ (Range[10] * 10^# & /@ Range[0, 2]),
  graphTruth},
  graphTruth =
      lists`listProportion[#,
        True] & /@ (Table[Module[{nodes = Range@#, graph},

        ConnectedGraphQ[
          Graph[# \[UndirectedEdge] RandomChoice[nodes] & /@ nodes]]
      ], 20] & /@ nNodes);
  associateLists[nNodes, graphTruth]
] & /@ Range@10]