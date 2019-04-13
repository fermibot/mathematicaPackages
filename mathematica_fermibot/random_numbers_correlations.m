(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-12 *)


ClearAll[correlationPlot];
correlationPlot[n_?IntegerQ] :=
    Module[{tickGrid = {Range[-1.5, 1.5, 0.1], Range[0.1, 1.5, 0.1]},
      sampleSize = n},
      SmoothHistogram[
        Table[Correlation[
          RandomVariate[UniformDistribution[{0, 1}], sampleSize],
          RandomVariate[UniformDistribution[{0, 1}],
            sampleSize]], {100}, {1000}], ImageSize -> 788, Frame -> True,
        PlotRange -> {{-1.5, 1.5}, {0, 1.5}},
        PlotStyle -> {{Red, Thickness -> 0, Opacity@0.1}},
        GridLines -> tickGrid, FrameTicks -> tickGrid,
        AspectRatio -> Divide[1, 2], Axes -> False,
        PlotLabel -> "Sample Size = " <> ToString[sampleSize]]] //
        Framed[#, FrameMargins -> 10, FrameStyle -> {GrayLevel[0.5]}] &

correlationPlot[n_?ListQ] :=
    Module[{tickGrid = {Range[-1.5, 1.5, 0.1], Range[0.1, 3, 0.1]}},
      SmoothHistogram[(Table[
        Correlation[RandomVariate[NormalDistribution[0, 1], #],
          RandomVariate[NormalDistribution[0, 1], #]], 10000] & /@ n),
        ImageSize -> 788, Frame -> True,
        PlotRange -> {{-1.5, 1.5}, {0, 3}}, GridLines -> tickGrid,
        FrameTicks -> tickGrid, AspectRatio -> Divide[1, 1],
        Axes -> False, PlotLegends -> Placed[n, Top]]] //
        Framed[#, FrameMargins -> 10, FrameStyle -> {GrayLevel[0.5]}] &

correlationPlot[#] & /@ Range[3, 10]

correlationPlot[{3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 20, 25, 30, 35, 40, 45, 50}]
