Module[{c = Association[]},

  (c["c" <> ToString[#]] =
      Style["Component " <> ToString[#], Darker@Green, 14]) & /@
      Range[5];
  (c["j" <> ToString[#]] = Style["Junction " <> ToString[#], Red]) & /@
      Range[4];
  MapThread[(c[#1] = #2) &, {{"start", "end"},
    Style[#, Blue] & /@ {"Start", "End"}}];

  TreePlot[
    {
      c["start"] -> c["j1"],
      c["j1"] -> c["c1"],
      c["c1"] -> c["j2"],
      c["j2"] -> c["c3"],
      c["j1"] -> c["c2"],
      c["c2"] -> c["j3"],
      c["j3"] -> c["c3"],
      c["j2"] -> c["c4"],
      c["c4"] -> c["j4"],
      c["j3"] -> c["c5"],
      c["c5"] -> c["j4"],
      c["j4"] -> c["end"]
    },
    Top, c["start"],
    VertexLabeling -> True, ImageSize -> 500, DirectedEdges -> False]
]