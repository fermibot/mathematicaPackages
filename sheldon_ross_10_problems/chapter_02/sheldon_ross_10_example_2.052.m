DistributionChart[
  Table[Table[
    Module[{data =
        Plus @@@ RandomVariate[ExponentialDistribution[1 / 40], {r, 25}]},
      N[Length[Select[data, # > 1100 &]] / r]],
    1000], {r, {100, 1000, 2000}}],
  ChartElementFunction -> "HistogramDensity",
  ChartLabels -> {100, 1000, 2000}, ImageSize -> 788]

Export[StringReplace[NotebookFileName[],
  ".nb" -> "_lifeTime_calculation.png"], %, ImageResolution -> 500]

ClearAll[lifeTimeMapper, lifeTimePoint];
lifeTimeMapper[list_List, r_ : 0] :=
    Module[{coordinates = {{0, r}}},
      coordinates = coordinates ~ Join ~ ({#, r} & /@ list)]
lifeTimePoint[list_,
  limit_ : 1100] := {If[#[[1]] <= limit, Red, Green],
  PointSize[0.005], Point[#]} & /@ list;
Module[{data =
    Accumulate /@
        RandomVariate[ExponentialDistribution[1 / 40], {1000, 25}]},
  Graphics[{
    {Thickness[0.005], Green,
      Line[{{1100, 0}, {1100, 10 Length@data}}]},
    Parallelize[{Thickness[0], Line[#]} & /@ (MapThread[
      lifeTimeMapper, {data, 10 Range[Length@data]}])],
    Parallelize[
      lifeTimePoint[#] & /@ (MapThread[
        lifeTimeMapper, {data, 10 Range[Length@data]}])]
  }, ImageSize -> 788, Frame -> True, FrameTicks -> {True, None}]]

Export[StringReplace[NotebookFileName[],
  ".nb" -> "_lifeTime_image.png"], %, ImageResolution -> 500]