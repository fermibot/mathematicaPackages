ClearAll[digitPad];
digitPad[number_, pad_, padObject_ : 0] :=
    StringPadLeft[ToString[number], pad, padObject]
exportFileName :=
    NotebookDirectory[] <> "random_art_07_" <>
        digitPad[Max[
          ToExpression[StringTake[StringDelete[#, ".png"], -2]] & /@
              FileNames["*png", NotebookDirectory[]]] + 1, 2, "0"] <> ".png"

Module[{export},
  export =
      Module[{iterations = 1000},
        iterations =
            Graphics[
              Table[{Hue[Divide[t, 2 \[Pi]]], Opacity@0.005,
                Disk[{Sin[t], Cos[t]}, 0.5]}, {t, Divide[2 \[Pi], iterations],
                2 \[Pi], Divide[2 \[Pi], iterations]}], ImageSize -> 788]];
  Export[exportFileName, export]
]

Module[{export},
  export =
      Module[{iterations = 2000},
        iterations =
            Graphics[
              Table[Rotate[{EdgeForm[{Black, Opacity[0.2], Thickness[0.001]}],
                FaceForm[{Hue[0.4], Opacity@0.02}],
                Rectangle[{Sin[t], Cos[t]}]}, t], {t,
                Divide[2 \[Pi], iterations], 2 \[Pi],
                Divide[2 \[Pi], iterations]}], ImageSize -> 788]];
  Export[exportFileName, export];
]

Module[{export},
  export =
      Module[{iterations = 500},
        iterations =
            Graphics[
              Table[Rotate[{EdgeForm[{Black, Opacity[0.2],
                Thickness[0.001]}], FaceForm[{Hue[0.4], Opacity@0.02}],
                Rectangle[{Sin[t], Cos[t]}]}, t], {t,
                Divide[2 \[Pi], iterations], 2 \[Pi],
                Divide[2 \[Pi], iterations]}], ImageSize -> 788]];
  Export[exportFileName, export];
]

