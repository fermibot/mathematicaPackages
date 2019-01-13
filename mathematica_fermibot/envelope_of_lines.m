(* :OriginalCreationDate: 2019-01-05 *)

Manipulate[
  Graphics[{Thickness@0, Opacity@0.5,
    Line[{{Sin[#], Cos[#]}, {Sin[# - r \[Pi]],
      Cos[# + r \[Pi]]}}]} & /@
      Range[1, 2 \[Pi], Divide[\[Pi], 100]], ImageSize -> 788], {r, 0, 1}]

With[{r = 0.75},
  Graphics[{Thickness@0, Opacity@0.1,
    Line[{{Sin[#], Cos[#]}, {Sin[# + r \[Pi]],
      Cos[# + r \[Pi]]}, {1.5 Sin[#],
      1.5 Cos[#]}, {1.5 Sin[# - r \[Pi]],
      1.5 Cos[# + r \[Pi]]}}]} & /@
      Range[1, 2 \[Pi], Divide[\[Pi], 2000]], ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_01.png", %, ImageSize -> 788]*)

With[{r = 0.75},
  Graphics[{Thickness@0, Opacity@0.1,
    Line[{{Sin[#], Cos[#]}, {Sin[# + r \[Pi]],
      Cos[# + r \[Pi]]}, {1.5 Sin[#],
      1.5 Cos[#]}, {1.5 Sin[# - r \[Pi]],
      1.5 Cos[# + r \[Pi]]}}]} & /@
      Range[Divide[\[Pi], 2000], 2 \[Pi], Divide[\[Pi], 2000]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_01_full.png", %, ImageSize -> 788]*)

With[{r = 0.1},
  Graphics[{Thickness@0, Opacity@0.1,
    Line[{{Sin[#], Cos[#]}, {1.25 Sin[# + r \[Pi]],
      1.25 Cos[# + r \[Pi]]}, {1.5 Sin[# - 0.5 r \[Pi]],
      1.5 Cos[# - 0.5 r \[Pi]]}, {1.75 Sin[# + r \[Pi]],
      1.75 Cos[# + r \[Pi]]}, {2 Sin[#], 2 Cos[#]}}]} & /@
      Range[Divide[\[Pi], 2000], 2 \[Pi], Divide[\[Pi], 2000]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[]<>"envelope_02.png",%,ImageSize\[Rule]788]*)

With[{r = 0.75},
  Graphics[{Thickness@0, Opacity@0.1,
    Line[{{Sin[#], Cos[#]}, {Sin[# + r \[Pi]],
      Cos[# + r \[Pi]]}, {1.5 Sin[r #],
      1.5 Cos[r #]}, {1.5 Sin[# + r \[Pi]],
      1.5 Cos[# + r \[Pi]]}}]} & /@
      Range[Divide[\[Pi], 2000], 2 \[Pi], Divide[\[Pi], 2000]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_05.png", %, ImageSize -> 788]*)

With[{r = 0.75},
  Graphics[{Thickness@0, Opacity@0.05,
    Line[{{2 Sin[#], 2 Cos[#]}, {1.75 Sin[# + r \[Pi]],
      1.75 Cos[# - r \[Pi]]}, {Sin[#],
      Cos[#]}, {1.75 Sin[# - r \[Pi]],
      1.75 Cos[# + r \[Pi]]}, {2 Sin[#], 2 Cos[#]}}]} & /@
      Range[Divide[\[Pi], 2000], 2 \[Pi], Divide[\[Pi], 2000]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_06.png", %, ImageSize -> 788]*)

With[{r = 0.5},
  Graphics[{Thickness@0, Opacity@0.05,
    Line[{{2 Sin[#], 2 Cos[#]}, {1.75 Sin[# + r \[Pi]],
      1.75 Cos[# - r \[Pi]]}, {Sin[#],
      Cos[#]}, {1.75 Sin[# - r \[Pi]],
      1.75 Cos[# + r \[Pi]]}, {2 Sin[#], 2 Cos[#]}}]} & /@
      Range[Divide[\[Pi], 2000], 2 \[Pi], Divide[\[Pi], 2000]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_07.png", %, ImageSize -> 788]*)

With[{r = 0.25, pieces = 2000},
  Graphics[{Thickness@0, Opacity@0.05,
    Line[{{Sin@-#, Cos@#}, {1.5 Sin[# + 3 r \[Pi]],
      1.5 Cos[# - 3 r \[Pi]]}, {Sin@#,
      Cos@-#}, {1.5 Sin[# - 2 r \[Pi]],
      1.5 Cos[# + 2 r \[Pi]]}, {Sin@-#,
      Cos@#}, {1.5 Sin[# + r \[Pi]], 1.5 Cos[# - r \[Pi]]}}]} & /@
      Range[Divide[\[Pi], pieces], 2 \[Pi], Divide[\[Pi], pieces]],
    ImageSize -> 788]]
(*Export[NotebookDirectory[] <> "envelope_08.png", %, ImageSize -> 788]*)


Module[{step = Divide[\[Pi], 400], images, partition = 10},
  images = With[{offset = #, iterations = 200},
    Export[ToString[N@#] <> ".png", Graphics[{
      Table[{
        Opacity@0.1,
        Line[
          {{Cos@n, Sin@n},
            {2 + Sin[n + 2 \[Pi] offset], Cos[n + 2 \[Pi] offset]},
            {2 + Cos[n + 2 \[Pi] 2 offset],
              2 + Sin[n + 2 \[Pi] 2 offset]},
            {Sin[n + 2 \[Pi] 3 offset], 2 + Cos[n + 2 \[Pi] 3 offset]},
            {Cos[n + 2 \[Pi] 4 offset], Sin[n + 2 \[Pi] 4 offset]}
          }
        ]}, {n, Divide[2 \[Pi], iterations], 2 \[Pi],
        Divide[2 \[Pi], iterations]}]}, ImageSize -> 788,
      PlotRange -> {{-1, 3}, {-1, 3}}], ImageDimensions -> 788,
      ImageResolution -> 500]] & /@ Range[0, Pi / 4, step];
  If[Mod[Length@images, partition] != 0,
    images = PadRight[images,
      Times[Quotient[Length@images, partition] + 1, partition], ""]];
  Grid[Partition[images, partition]]]