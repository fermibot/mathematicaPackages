ListLinePlot[{Sin[Prime@199 # \[Degree]],
  Cos[Prime@198 # \[Degree]]} & /@ Range[0, 360, #],
  AspectRatio -> 1, ImageSize -> 200,
  PlotStyle -> {Red, , Opacity[0.5], Thickness[0]},
  Background -> Black, Axes -> False,
  PlotRange -> {{-1, 1}, {-1, 1}}] & /@ Range[0.1, 1, 0.1]


ListLinePlot[{Sin[Prime@900 # \[Degree]],
  Cos[Prime@25 # \[Degree]]} & /@ Range[0, 360], AspectRatio -> 1,
  ImageSize -> 788, PlotStyle -> {Red, Thickness[0]},
  Background -> Black, Axes -> False, PlotRange -> {{-1, 1}, {-1, 1}}]

ListLinePlot[{Sin[Prime@500 # \[Degree]],
  Cos[Prime@654 # \[Degree]]} & /@ Range[0, 360], AspectRatio -> 1,
  ImageSize -> 788, PlotStyle -> {Red, Thickness[0]},
  Background -> Black, Axes -> False, PlotRange -> {{-1, 1}, {-1, 1}}]

ListLinePlot[{Sin[Prime@100 # \[Degree]],
  Cos[Prime@110 # \[Degree]]} & /@ Range[0, 360, 0.5],
  AspectRatio -> 1, ImageSize -> 788, PlotStyle -> {Red, Thickness[0]},
  Background -> Black, Axes -> False, PlotRange -> {{-1, 1}, {-1, 1}}]