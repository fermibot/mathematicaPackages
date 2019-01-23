ClearAll[digitPad];
digitPad[number_, pad_, padObject_ : 0] :=
    StringPadLeft[ToString[number], pad, padObject]
exportFileName :=
    NotebookDirectory[] <> "random_art_07_" <>
        digitPad[Max[
          ToExpression[StringTake[StringDelete[#, ".png"], -2]] & /@
              FileNames["*png", NotebookDirectory[]]] + 1, 2, "0"] <> ".png";


Graphics[Table[{Opacity@0.2, Thickness@0, Hue[RandomReal[{0.5, 0.7}]],
  BezierCurve[r + # & /@ RandomReal[0.1 {-1, 1}, {10, 2}]]}, {r,
  Table[{RandomReal[{-1, 1}], RandomReal[{-0.5, 0.5}]}, 10000]}],
  ImageSize -> 788]