randomize[obj_, level_ : 0.5] := obj + RandomReal[{-level, level}]
ImageRotate[
  ListPlot[Parallelize[
    randomize /@
        ToExpression /@
            StringSplit[StringJoin @@ ToString /@ Range[1000000], ""]],
    ImageSize -> 1600, AspectRatio -> 0.25,
    PlotStyle -> {Thickness@0.001, PointSize@0.0005, Opacity[0.01],
      Darker@Green}, Axes -> False], 90]
(*Export[NotebookDirectory[]<>"staircase.png",%,ImageSize\[Rule]5000,\
ImageResolution\[Rule]1000]*)


ListPlot[Parallelize[
  randomize /@
      ToExpression /@
          StringSplit[StringJoin @@ ToString /@ Range[100000], ""]],
  ImageSize -> 1600, AspectRatio -> 0.25,
  PlotStyle -> {Thickness@0.001, PointSize@0.0005, Opacity[0.5],
    LightBlue}, Axes -> False]
(*Export[NotebookDirectory[]<>"staircase.png",%,ImageSize\[Rule]1600,\
ImageResolution\[Rule]1000]*)

Framed@ListPlot[
  Parallelize[
    randomize /@
        ToExpression /@
            StringSplit[StringJoin @@ ToString /@ Range[10000], ""]],
  ImageSize -> 1600, AspectRatio -> 0.25,
  PlotStyle -> {Thickness@0.001, PointSize@0, Opacity[1],
    Darker@Green}, Axes -> False]
(*Export[NotebookDirectory[]<>"staircase.png",%,ImageSize\[Rule]1600,\
ImageResolution\[Rule]1000]*)

Show[ImageRotate[
  ListPlot[Parallelize[
    randomize /@
        ToExpression /@
            StringSplit[StringJoin @@ ToString /@ Range[10000], ""]],
    AspectRatio -> 0.25,
    PlotStyle -> {Thickness@0.001, PointSize@0.0005, Opacity[1], Blue},
    Axes -> False, ImageSize -> 6400], 90 \[Degree]]]
(*Export[NotebookDirectory[]<>"staircase.png",%,ImageSize\[Rule]5000,\
ImageResolution\[Rule]1000]*)