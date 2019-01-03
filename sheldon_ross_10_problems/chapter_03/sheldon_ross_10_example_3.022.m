\!\(
\ * SubsuperscriptBox[\(\[Integral]\), \(0\), \(\[Infinity]\)]\(
\ * FractionBox[\(
\ * SuperscriptBox[\(\[Lambda]\), \(n + 1\)]
\ * SuperscriptBox[\(E\), \(\(-2\) \[Lambda]\)]\), \(n!\)]
\[DifferentialD]\[Lambda]\)\)



ListPlot[(# + 1) / 2^(# + 2) & /@ Range@20, PlotRange -> All]

Show[Histogram[
  RandomVariate[
    PoissonDistribution[RandomVariate[ExponentialDistribution[1]]],
    1000000], Automatic, "Probability", PlotRange -> All],
  ListPlot[(# + 1) / (Power[2, # + 2]) & /@ Range@20, PlotRange -> All]]