AppendTo[$Path, "D:\\Mathematica Files 4K\\Packages"];
Needs["utilities`"];

ClearAll[listCompare];

listCompare[masterSample_List, randomSample_List] :=
    Module[{alphabet = masterSample, sample = randomSample},
      Table[
        If[alphabet[[n]] == sample[[n]],
          Style[sample[[n]], Darker@Green, Underlined, 15],
          Style[sample[[n]], Red, 15]],
        {n, 1, Length[sample]}]]

Module[{alphabet = Alphabet[],
  scenarios = Table[RandomSample[Alphabet[], 26], 100], reSelection,
  tableForm},
  reSelection = {Style[#, Bold, 15] & /@ Alphabet[]} ~
      Join ~ (listCompare[alphabet, #] & /@ scenarios);
  reSelection = styledStringJoin[#, " | "] & /@ reSelection;
  tableForm = TableForm@reSelection;

  Export[StringReplace[NotebookFileName[], ".nb" -> ".png"], tableForm,
    ImageSize -> 788, ImageResolution -> 900]
]



Module[{list = Range[26], sample, barData, trials = 100000},
  sample := RandomSample[list, Length@list];
  barData =
      Reverse[
        Sort[
          Counts[
            Table[
              Plus @@ Table[
                If[list[[n]] == sample[[n]], 1, 0], {n, 1, Length@list}],
              trials]]]];

  BarChart[barData, ChartLabels -> Keys@barData,
    LabelingFunction -> (Placed[#, Above] &),
    PlotLabel -> ToString[trials] <> " trials"]
]

Export[StringReplace[NotebookFileName[], ".nb" -> "_02.png"], %,
ImageSize -> 788, ImageResolution -> 900]