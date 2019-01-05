Grid[Partition[#, 3], Frame -> All, FrameStyle -> Gray] &[
  Table[With[{p = probability, range = 80},
    Overlay[{Graphics[
      Table[{Opacity@0.5, Thickness@0.0,
        Line[Accumulate[{RandomChoice[{p, 1 - p} -> {-1, 1}],
          RandomChoice[{-1, 1}]} & /@ Range[100]]]}, 1000],
      PlotRange -> ConstantArray[{-range, range}, 2],
      ImageSize -> 262], "p = " <> ToString[p]}]], {probability,
    Range[0.1, 0.9, 0.1]}]]