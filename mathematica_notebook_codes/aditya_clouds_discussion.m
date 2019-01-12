Graphics[{{Lighter@Gray, Disk[{-1, 0}, 0.8]}, {Lighter@Gray,
  Disk[{1, 0}, 0.8]}}, ImageSize -> 800]
Graphics[{{Lighter@Gray, Disk[{-1, 0}, 0.8]}, {Lighter@Gray,
  Disk[{1, 0}, 0.8]},
  Text[Style["-", 15, Red], {-1 + 0.9 Sin@#, 0.9 Cos@#}] & /@
      Range[0, 2 \[Pi], 0.1 \[Pi]],
  Text[Style["+", 15, Green], {1 + 0.9 Sin@#, 0.9 Cos@#}] & /@
      Range[0, 2 \[Pi], 0.1 \[Pi]]}, ImageSize -> 800]

Graphics[{{Red,
  Point[{RandomReal[{-1, 0.2}], RandomReal[{-1, 1}]}]} & /@
    Range[1000], {Darker@Green,
  Point[{RandomReal[{-0.2, 1}], RandomReal[{-1, 1}]}]} & /@
    Range[1000]}]

Graphics[{Thickness[0], Opacity[1],
  Line[Accumulate[RandomReal[{-1, 1}, {10000, 2}]]]}] & /@ Range[10]
MapThread[
  Export[StringReplace[NotebookFileName[],
    ".nb" -> ToString[#2] <> ".png"], #1, ImageSize -> 1000,
    ImageResolution -> 400] &, {%, Range[Length@%]}]