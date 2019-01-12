ClearAll[digitPad];
digitPad[number_, pad_, padObject_ : 0] :=
    StringPadLeft[ToString[number], pad, padObject]

Module[{export},
  export =
      Module[{iterations = 1000},
        iterations =
            Graphics[
              Table[{Hue[Divide[t, 2 \[Pi]]], Opacity@0.005,
                Disk[{Sin[t], Cos[t]}, 0.5]}, {t, Divide[2 \[Pi], iterations],
                2 \[Pi], Divide[2 \[Pi], iterations]}], ImageSize -> 788]];
  Export[NotebookDirectory[] <> "random_art_07_" <>
      digitPad[
        Max[ToExpression[StringTake[StringDelete[#, ".png"], -2]] & /@
            FileNames["*png", NotebookDirectory[]]] + 1, 2, "0"] <> ".png",
    export]
]


Graphics[Table[{Hue[Divide[n, 25 Pi]], Opacity[0.02],
  Disk[{Sin[n], Cos[n]}, 0.5]}, {n, 0.01 \[Pi], 2 \[Pi],
  0.01 \[Pi]}]]