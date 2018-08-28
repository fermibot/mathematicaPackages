Module[{iterations = {10, 20, 30, 50, 100, 200, 300, 500, 1000, 2000}},
  DistributionChart[
    Table[Module[{alphabet = Alphabet[], samples = #, data,
      firstSelection, secondSelection},
      data = Table[RandomSample[Alphabet[]], samples];
      data = DeleteCases[data, {"a"} ~ Join ~ ConstantArray[_, 25]];
      firstSelection = Length[data];
      N@Mean[
        Count[MapThread[#1 == #2 &, {Alphabet[], #}], True] & /@ data]
    ], 1000] & /@ iterations,
    ChartElementFunction -> "PointDensity", GridLines -> {None, {0.96}},
    ChartLabels -> iterations, ImageSize -> 788]]

Export[StringReplace[NotebookFileName[], ".nb" -> "_chart_01.png"], %,
ImageResolution -> 500]

mixAndMatchHats2[listIn_List] := Module[{samples = 1000},
  DistributionChart[
    Table[Module[{list = #, data, firstSelection, secondSelection},
      data = Table[RandomSample[list], samples];
      data =
          DeleteCases[
            data, {list[[1]]} ~ Join ~ ConstantArray[_, Length@list - 1]];
      N@Mean[Count[MapThread[#1 == #2 &, {list, #}], True] & /@ data]
    ], 1000] & /@ listIn, ChartElementFunction -> "PointDensity",
    ImageSize -> 788,
    GridLines -> {None, ((# - 2) / (# - 1)) & /@ (Length /@ listIn)},
    ChartLabels -> Length /@ listIn]]


mixAndMatchHats2[Table[Range[n], {n, {10, 20, 30, 50, 100, 200, 500}}]]
Export[StringReplace[NotebookFileName[], ".nb" -> "_chart_02.png"], %,
ImageResolution -> 500]


ListPlot[Table[{n, (n - 2) / (n - 1)}, {n, 3, 25}],
  GridLines -> {# & /@ Range[3, 25], (# - 2) / (# - 1) & /@ Range[3, 25]},
  ImageSize -> 788, PlotStyle -> PointSize[0.01], Frame -> True,
  PlotMarkers -> \!\(\ *
Graphics3DBox[
  GraphicsComplex3DBox[
    NCache[{{
      0, 0, (-5) (50 - 10 5^Rational[1, 2])^Rational[-1, 2]}, {
      0, 0, 5 (50 - 10 5^Rational[1, 2])^Rational[-1, 2]}, {-(2 / (
      5 - 5^Rational[1, 2]))^Rational[1, 2],
      0, -(10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(2 / (
      5 - 5^Rational[1, 2]))^Rational[1, 2],
      0, (10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1, 2]) (
      1 + 5^Rational[1, 2]),
      Rational[-1,
        2], -(10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1, 2]) (
      1 + 5^Rational[1, 2]), Rational[
      1, 2], -(10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[-1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1, 2]) (
      1 + 5^Rational[1, 2]),
      Rational[-1, 2], (
        10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[-1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1, 2]) (
      1 + 5^Rational[1, 2]), Rational[
      1, 2], (10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[-1, 2] (
        10 - 2 5^Rational[1, 2])^Rational[-1,
        2]) (-1 + 5^Rational[1, 2]),
      Rational[-1,
        2] ((5 - 5^Rational[1, 2])^(-1) (
        5 + 5^Rational[1, 2]))^Rational[1, 2], -(
        10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[-1, 2] (
        10 - 2 5^Rational[1, 2])^Rational[-1,
        2]) (-1 + 5^Rational[1, 2]),
      Rational[
        1, 2] ((5 - 5^Rational[1, 2])^(-1) (
        5 + 5^Rational[1, 2]))^Rational[1, 2], -(
        10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[
        1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1,
        2]) (-1 + 5^Rational[1, 2]),
      Rational[-1,
        2] ((5 - 5^Rational[1, 2])^(-1) (
        5 + 5^Rational[1, 2]))^Rational[1, 2], (
        10 - 2 5^Rational[1, 2])^Rational[-1, 2]}, {(
      Rational[
        1, 2] (10 - 2 5^Rational[1, 2])^Rational[-1,
        2]) (-1 + 5^Rational[1, 2]),
      Rational[
        1, 2] ((5 - 5^Rational[1, 2])^(-1) (
        5 + 5^Rational[1, 2]))^Rational[1, 2], (
        10 - 2 5^Rational[1, 2])^Rational[-1, 2]}}, {{
      0, 0, -0.9510565162951536}, {
      0, 0, 0.9510565162951536}, {-0.85065080835204,
      0, -0.42532540417601994`}, {
      0.85065080835204, 0, 0.42532540417601994`}, {
      0.6881909602355868, -0.5, -0.42532540417601994`}, {
      0.6881909602355868,
      0.5, -0.42532540417601994`}, {-0.6881909602355868, -0.5,
      0.42532540417601994`}, {-0.6881909602355868, 0.5,
      0.42532540417601994`}, {-0.2628655560595668,
      -0.8090169943749475, -0.42532540417601994`}, {-0.2628655560595668,
      0.8090169943749475, -0.42532540417601994`}, {
      0.2628655560595668, -0.8090169943749475,
      0.42532540417601994`}, {0.2628655560595668,
      0.8090169943749475, 0.42532540417601994`}}],
    Polygon3DBox[{{2, 12, 8}, {2, 8, 7}, {2, 7, 11}, {2, 11, 4}, {2,
      4, 12}, {5, 9, 1}, {6, 5, 1}, {10, 6, 1}, {3, 10, 1}, {9, 3,
      1}, {12, 10, 8}, {8, 3, 7}, {7, 9, 11}, {11, 5, 4}, {4, 6,
      12}, {5, 11, 9}, {6, 4, 5}, {10, 12, 6}, {3, 8, 10}, {9, 7,
      3}}]],
  Boxed -> False,
  ImageSize -> {25., Automatic},
  ViewPoint -> {1.3, -2.4, 2.},
  ViewVertical -> {0., 0., 1.}]\),
FrameLabel -> {"Length of the list",
  "E[X|\!\(\*SubscriptBox[\(X\), \(1\)]\)=0"}, PlotRange -> All]
Export[StringReplace[NotebookFileName[], ".nb" -> "_chart_03.png"], %,
ImageResolution -> 500]