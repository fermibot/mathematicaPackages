ClearAll[toIntegrate, probabilityFunction, cdfProbabilityFunction];

toIntegrate[x_] := Sin[0.5 \[Pi] x]
probabilityFunction[x_] :=
    Module[{constant = NIntegrate[-(r - 1)^2 + 1, {r, 0, 2}]},
      Divide[-(x - 1)^2 + 1, constant]]
probabilityFunction[x_] := PDF[TriangularDistribution[{0, 2}], x]
cdfProbabilityFunction[x_] :=
    Integrate[probabilityFunction[r], {r, 0, x}]
inverseCDFProbabilityFunction[x_] :=
    InverseCDF[TriangularDistribution[{0, 2}], x]
Plot[{toIntegrate[x], probabilityFunction[x],
  cdfProbabilityFunction[x]}, {x, 0, 2}, PlotLegends -> "Expressions",
  AspectRatio -> 0.5, ImageSize -> 788,
  Epilog -> {{Opacity[0.5], Blue, Dotted,
    InfiniteLine[{{1, 0}, {1, 1}}]}, {Opacity[0.5], Dotted, Blue,
    InfiniteLine[{{0, 0.5}, {2, 0.5}}]}}]


With[{r = #},
  Histogram[
    Mean[With[{\[Xi] = RandomVariate[TriangularDistribution[{0, 2}]]},
      toIntegrate[\[Xi]] / probabilityFunction[\[Xi]]] & /@
        Range@r] & /@ Range[10000], 150, ImageSize -> 788,
    PlotRange -> {{1.00, 1.50}, All},
    PlotLabel -> "\[Eta] size = " <> ToString@r]] & /@ {10, 20, 30,
  50, 100}