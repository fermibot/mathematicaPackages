Module[{solutions, initials},
  initials = Range[0, 600, 40];
  solutions =
      Table[DSolve[{y'[t] == 10 - Divide[5, 200] y[t], y[0] == initial},
        y[t], t], {initial, initials}];
  Plot[Evaluate[y[t] /. solutions], {t, 0, 200}, ImageSize -> 788,
    PlotRange -> All, AspectRatio -> 1, Frame -> True,
    PlotLegends ->
        Placed[("y[0] = " <> ToString[#] & /@ initials), Below],
    PlotLabel -> Style["y[t] vs. t", 20]]
]

Plot[{\[Mu], 0.5 \[Mu]}, {\[Mu], 0, 40}, ImageSize -> 788,
  PlotRange -> All, AspectRatio -> 0.5, Frame -> True,
  PlotLegends -> Placed[{"\[Mu](c) vs c", " \[Sigma](c) vs c"}, Below]]

Module[{solutions, sample, sampleSize = 2, initials, mean, ci},
  sample = RandomVariate[NormalDistribution[40, 0.1 * 40], sampleSize];
  mean = Mean@sample;
  ci = Divide[
    InverseCDF[StudentTDistribution[sampleSize - 1],
      0.95] StandardDeviation[sample], Sqrt[sampleSize - 1]];
  initials = {mean, mean + ci, mean - ci};
  solutions =
      Table[DSolve[{y'[t] == 10 - Divide[5, 200] y[t], y[0] == initial},
        y[t], t], {initial, initials}];
  Plot[Evaluate[y[t] /. solutions], {t, 0, 200}, ImageSize -> 788,
    PlotRange -> All, AspectRatio -> 1, Frame -> True,
    PlotLegends ->
        Placed[("y[0] = " <> ToString[#] & /@ initials[[1 ;; 1]]), Below],
    PlotLabel -> Style["\nSample Size = " <> ToString[sampleSize], 14],
    PlotStyle -> {Red, Lighter@Green, Lighter@Green},
    Filling -> {2 -> {3}}]
]

Framed@Grid[Partition[#, 3]] &[
  Table[Module[{solutions, sample, sampleSize = sampleSizeIn, initials,
    mean, ci},
    sample = RandomVariate[NormalDistribution[40, 0.1 * 40], sampleSize];
    mean = Mean@sample;
    ci = Divide[
      InverseCDF[StudentTDistribution[sampleSize - 1],
        0.95] StandardDeviation[sample], Sqrt[sampleSize - 1]];
    initials = {mean, mean + ci, mean - ci};
    solutions =
        Table[DSolve[{y'[t] == 10 - Divide[5, 200] y[t], y[0] == initial},
          y[t], t], {initial, initials}];
    Plot[Evaluate[y[t] /. solutions], {t, 0, 200}, ImageSize -> 262,
      PlotRange -> All, AspectRatio -> 0.5, Frame -> True,
      PlotLegends ->
          Placed[("y[0] = " <> ToString[#] & /@ initials[[1 ;; 1]]),
            Below], PlotLabel ->
        Style["\nSample Size = " <> ToString[sampleSize], 14],
      PlotStyle -> {Red, Lighter@Green, Lighter@Green},
      Filling -> {2 -> {3}}]
  ], {sampleSizeIn, {2, 3, 4, 5, 10, 20, 25, 50, 60, 75}}]]