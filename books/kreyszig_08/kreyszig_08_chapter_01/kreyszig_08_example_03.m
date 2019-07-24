Module[{solutions, outsides, constants},
  outsides = Range[0, 60, 2];
  solutions =
      Table[DSolve[{T'[t] == k (T[t] - outside), T[0] == 66}, T[t], t][[1,
          1, 2]], {outside, outsides}];
  constants =
      N[Solve[(# /. t -> 2) == 63 && k < 0, k]][[1, 1, 2]] & /@ solutions;
  solutions = MapThread[#1 /. k -> #2 &, {solutions, constants}];
  Plot[Evaluate[solutions], {t, 0, 200}, ImageSize -> 788,
    AspectRatio -> 1, Frame -> True,
    PlotLegends ->
        Placed[("y[0] = " <> ToString[#] <> "\[Degree]C" & /@ outsides),
          Below], PlotLabel -> Style["y[t] vs. t", 20],
    GridLines -> {Range[20, 200, 5], outsides},
    FrameTicks -> {Range[20, 200, 5], outsides},
    PlotRange -> {{0, 200}, {0, 70}}]
]

Module[{solutions, twoHourTemps = Range[33, 63, 1], constants},
  solutions =
      DSolve[{T'[t] == k (T[t] - 32), T[0] == 66}, T[t], t][[1, 1, 2]];
  constants =
      N[Solve[(solutions /. t -> 2) == # && (k < 0 || k > 0), k]][[1, 1,
          2]] & /@ twoHourTemps;
  solutions = MapThread[solutions /. k -> # &, {constants}];
  Plot[Evaluate[solutions], {t, 0, 200}, ImageSize -> 788,
    AspectRatio -> 1, Frame -> True,
    PlotLegends ->
        Placed[("t[2] = " <> ToString[#] <> "\[Degree]C" & /@
            twoHourTemps), Below], PlotLabel -> Style["y[t] vs. t", 20],
    GridLines -> {Range[20, 200, 5], twoHourTemps},
    FrameTicks -> {Range[20, 200, 5], twoHourTemps},
    PlotRange -> {{0, 200}, {0, 70}}]
]
