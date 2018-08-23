GraphicsGrid[
  Partition[
    Module[{data =
        Table[Table[{{n, m},
          Divide[RandomReal[{-1, 1}], Power[2, r]]}, {n, 0, 128,
          Power[2, 5 - r]}, {m, 0, 128, Power[2, 5 - r]}], {r, 0, 9}],
      interpolatedFunctions},
      interpolatedFunctions = Interpolation[Flatten[#, 1]] & /@ data;
      DensityPlot[
        Plus @@ (#[x, y] & /@ interpolatedFunctions), {x, 0, 128}, {y,
        0, 128}, AspectRatio -> 1, Frame -> False,
        WorkingPrecision -> 50, PlotPoints -> 100, ImageSize -> 300,
        ColorFunction -> #] & /@ ColorData["Gradients"]
    ], 3]]