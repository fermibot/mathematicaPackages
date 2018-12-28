ClearAll[associationRandomizer];
associationRandomizer[association_?AssociationQ, offset_Real : 0.3] :=
    MapThread[{#1 + RandomReal[{-offset, offset}], #2 +
        RandomReal[{-offset, offset}]} &, {Keys@association,
      Values@association}]

Module[{plotData = List[], plotExtent = 15},
  Do[
    Module[{coupons = Take[Alphabet[], 26], newCoupon,
      couponCollection = List[], plotSubData},
      newCoupon := RandomChoice@coupons;
      While[True,
        AppendTo[couponCollection, newCoupon];
        If[Union@couponCollection == coupons, Break[]]
      ];
      plotSubData = KeySort@Counts@Values@Counts@couponCollection;
      AppendTo[plotData, plotSubData]
    ]
    , 2000];
  ListPlot[associationRandomizer /@ plotData, AspectRatio -> 1,
    Frame -> True, PlotRange -> ConstantArray[{0, plotExtent}, 2],
    GridLines -> ConstantArray[Range@plotExtent, 2],
    PlotStyle -> {{PointSize@0.002, Darker@Green}},
    GridLinesStyle -> Directive[Lighter@Gray, Dashed], ImageSize -> 788,
    FrameLabel -> (Style[#, Gray, 16] & /@ {"Repeating coupons",
      "Number of such occurrences"})]
]


Grid[Partition[#, 3]] &[
  Table[Module[{plotData = List[], plotExtent = 15},
    Do[
      Module[{coupons = Take[Alphabet[], take], newCoupon,
        couponCollection = List[], plotSubData},
        newCoupon := RandomChoice@coupons;
        While[True,
          AppendTo[couponCollection, newCoupon];
          If[Union@couponCollection == coupons, Break[]]
        ];
        plotSubData = KeySort@Counts@Values@Counts@couponCollection;
        AppendTo[plotData, plotSubData]
      ]
      , 1000];
    ListPlot[associationRandomizer /@ plotData, AspectRatio -> 1,
      Frame -> True, PlotRange -> ConstantArray[{0, plotExtent}, 2],
      PlotStyle -> {{PointSize@0.0, Darker@Green}},
      GridLinesStyle -> Directive[Lighter@Gray, Dashed],
      ImageSize -> 200,
      Epilog -> {Text[
        "Unique coupons \nfor taking = " <> ToString[take], {10, 12}]}]
  ], {take, Range[4, 26, 2]}]]