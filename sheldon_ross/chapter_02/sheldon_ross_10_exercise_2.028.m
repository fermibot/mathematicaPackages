AppendTo[$Path, "D:\\Mathematica Files 4K\\Packages"];
Needs["utilities`"];

ClearAll[randomWeights, fairStyle, biasedFlips]

randomWeights[r_] :=
    RandomSample[Range[r]] / Total[Range[r]] ->
        ToUpperCase[Alphabet[]][[1 ;; r]]

fairStyle[list_List] := Module[{newList = list},
  newList = list;
  If[Union[list] == Sort[list],

    newList[[Length[list]]] =
        Style[Last@newList, Blue, Bold, Background -> LightBlue];
    Framed@Style[stringJoinStyled[newList, " "], Darker@Green],
    Style[stringJoinBuffer[newList, " "], GrayLevel[0.8],
      FontVariations -> {"StrikeThrough" -> True}]]
]

biasedFlips[r_, sample_ : 10000000] :=
    Module[{data = Partition[RandomChoice[randomWeights[r], sample], r],
      plotLabel, usable},
      data = Counts[Last[#] & /@ Select[data, Union[#] == Sort[#] &]];
      usable = Plus @@ data;
      plotLabel = StringJoin @@ {ToString@r, " outcomes: usable flips = ",
        ToString@usable, " of ", ToString@sample, " = ",
        ToString@N[usable * 100 / sample], " %"};
      plotLabel = Style[plotLabel, 15, Darker@Green];
      BarChart[data, ChartLabels -> Automatic,
        LabelingFunction -> (Placed[#, Above] &),
        ImageSize -> 390, PlotLabel -> plotLabel]
    ]

Module[{plot = biasedFlips[#]},
  Export[StringReplace[NotebookFileName[], ".nb" -> "_" <> ToString[#]
      <> "_outcomes_barChart.png"], plot, ImageSize -> 390]] & /@
    Range[2, 10]

Grid@Partition[
  fairStyle /@ Partition[RandomChoice[Range[5], 1500], 5], 8]
Export[StringReplace[NotebookFileName[], ".nb" -> "_grid_01.png"], %,
ImageSize -> 788, ImageResolution -> 1200]