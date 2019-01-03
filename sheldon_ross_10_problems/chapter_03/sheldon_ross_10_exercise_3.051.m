ClearAll[geometricOddEven]
geometricOddEven[p_Real] := {{p, \!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(\[Infinity]\)]\(
\*SuperscriptBox[\((1 - p)\), \(\((2  i - 1)\) - 1\)] p\)\)}, {p, \!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(\[Infinity]\)]\(
\*SuperscriptBox[\((1 - p)\), \(2  i - 1\)] p\)\)}}
geometricOddEven[p_List] := geometricOddEven /@ p

Module[{data = geometricOddEven[Range[0.05, 0.95, 0.05]]},
  ListLinePlot[
    Transpose[data],
    Frame -> True,
    GridLines -> {Range[0, 1, 0.05], Range[0, 1, 0.05]},
    AspectRatio -> 1, ImageSize -> 700,
    PlotLegends -> {"P{X=Odd}", "P{X=Even}"}, Mesh -> All,
    MeshStyle -> {{Black, PointSize@0.005}},
    FrameLabel -> {Style["p", 15, Italic], Style["P{X=Odd} and P{X=Even}", 15, Italic]}
  ]
]
