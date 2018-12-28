ClearAll[associationRandomizer];
associationRandomizer[association_?AssociationQ, offset_Real : 0.3] :=
    MapThread[{#1 + RandomReal[{-offset, offset}], #2 +
        RandomReal[{-offset, offset}]} &, {Keys@association,
      Values@association}]

Module[{plotData = List[], plotExtent = 15},
  Do[
    Module[{coupons = Alphabet[], newCoupon, couponCollection = List[],
      plotSubData},
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
    Frame -> True, GridLines -> ConstantArray[Range@plotExtent, 2],
    PlotRange -> ConstantArray[{0, plotExtent}, 2],
    FrameLabel -> (Style[#, Gray, 16] & /@ {"Repeating coupons",
      "Number of such occurrences"}),
    PlotStyle -> {{PointSize@0.002, Darker@Green}},
    GridLinesStyle -> Directive[Lighter@Gray, Dashed], ImageSize -> 788]
]