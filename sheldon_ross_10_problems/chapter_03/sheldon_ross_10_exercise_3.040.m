Module[{samples = Range[10, 100, 10]},
 DistributionChart[
  Table[
   Mean /@ Table[
     Module[{t = 0,
       door := RandomChoice[{0.5, 0.3, 0.2} -> {2, 3, 0}], doorTemp},
      While[True,
       doorTemp = door;
       If[doorTemp != 0,
        t += doorTemp,
        Break[]
        ]
       ];
      t
      ]
     , 1000, sample]
   , {sample, samples}], ChartElementFunction -> "PointDensity",
  ChartLabels -> samples, ImageSize -> 788,
  GridLines -> {None, {9.5}},
  PlotLabel -> Style["Part-1 Mean:\[Mu]", 16, Red]]
 ]

Module[{samples = Range[10, 100, 10]},
 DistributionChart[
  Table[
   Variance /@ Table[
     Module[{t = 0,
       door := RandomChoice[{0.5, 0.3, 0.2} -> {2, 3, 0}], doorTemp},
      While[True,
       doorTemp = door;
       If[doorTemp != 0,
        t += doorTemp,
        Break[]
        ]
       ];
      t
      ]
     , 1000, sample]
   , {sample, samples}], ChartElementFunction -> "PointDensity",
  ChartLabels -> samples, ImageSize -> 788,
  GridLines -> {None, {9.5}},
  PlotLabel ->
   Style["Part-1 Variance:\!\(\*SuperscriptBox[\(\[Sigma]\), \
\(2\)]\)", 16, Red]]
 ]

Module[{samples = Range[10, 100, 10]},
 DistributionChart[
  Table[
   Mean /@ Table[
     Module[{time = 0,
       door := RandomChoice[
         ConstantArray[Divide[1, 3], 3] -> {2, 3, 0}], doorTemp},
      doorTemp = door;
      time += doorTemp;
      If[doorTemp == 2,
       time += RandomChoice[{3, 0}]; Break,
       If[doorTemp == 3,
        time += RandomChoice[{2, 0}]; Break,
        time += 0
        ]
       ];
      time
      ]
     , 1000, sample],
   {sample, samples}], ChartElementFunction -> "PointDensity",
  ChartLabels -> samples, ImageSize -> 788,
  GridLines -> {None, {2.5}},
  PlotLabel -> Style["Part-2 Mean:\[Mu]", 16, Red]]
 ]

Module[{samples = Range[10, 100, 10]},
 DistributionChart[
  Table[
   Variance /@ Table[
     Module[{time = 0,
       door := RandomChoice[
         ConstantArray[Divide[1, 3], 3] -> {2, 3, 0}], doorTemp},
      doorTemp = door;
      time += doorTemp;
      If[doorTemp == 2,
       time += RandomChoice[{3, 0}]; Break,
       If[doorTemp == 3,
        time += RandomChoice[{2, 0}]; Break,
        time += 0
        ]
       ];
      time
      ]
     , 1000, sample],
   {sample, samples}], ChartElementFunction -> "PointDensity",
  ChartLabels -> samples, ImageSize -> 788,
  GridLines -> {None, {2.5}},
  PlotLabel ->
   Style["Part-2 Variance:\!\(\*SuperscriptBox[\(\[Sigma]\), \
\(2\)]\)", 16, Red]]
 ]

