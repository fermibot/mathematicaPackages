(* ::Package:: *)

BeginPackage["utilities`"];

associator::usage = "Takes an element and converts into a an association with a value of 1";
associationAppender::usage = "A complex AppendTo, looks if the element the element passed already exists, If it does, it increments by that amount, if not, simply appends it.";
valuesMissing::usage = "Additional layer over Values to handle non-existent entries";
associationFunctionMap::usage = "Maps the function to the values in the and returns the modified form of it";
unitize::usage = "Takes in a list(association) and returns a list(association) whose sum(sum of values) equals one ";
associateLists::usage = "Takes two lists and MapThreads the first list to the second one and creates an association of of it";

accumulatingMean::usage = "Calculates the accumulating range of a list";
stringJoinStyled::usage = "Joins a list of styled string objects";
stringJoinBuffer::usage = "Joins a list of strings with a buffer in between them for spacing";

QuickSort::usage = "Fermibot's Mathematica implementation of Quick-Sort algorithm";
QuickSortTrack::usage = "It's again QuickSort but it shows the progress of the sorting mechanism";
QuickSortTrackRaw::usage = "QuickSortTrackRaw[]";
pivotedList::usage = "Supporting function needed for QuickSort";

InsertionSort::usage = "InsertionSort[]";
InsertionSortTrack::usage = "InsertionSortTrack[]";

ShellSort::usage = "ShellSort[]";
ShellSortTrack::usage = "ShellSortTrack[]";

SelectionSort::usage = "SelectionSort[]";
SelectionSortTrack::usage = "SelectionSortTrack[]";

FactorialRecursive::usage = "Factorial calculated using recursion";

Begin["Private`"];

Needs["qFunctions`"];

accumulatingMean[list_List] := N[Accumulate[list] / Range[1, Length[list]]];

associator[element_] := Association[element -> 1];

associationAppender[associationIn_Association, element_] :=
    Module[{association = associationIn, newEntry = associator[element],
      newEntryKey},
      newEntryKey = Keys[newEntry][[1]];
      If[! MemberQ[Keys[association], Keys[newEntry][[1]]],
        AppendTo[association, newEntry],
        association[newEntryKey] =
            association[newEntryKey] + newEntry[newEntryKey];
        association
      ]
    ];

associationAppender[list_List] :=
    Module[{seedAssociation = <||>},
      Table[seedAssociation =
          associationAppender[seedAssociation, list[[r]]], {r, 1,
        Length@list}]];

valuesMissing[association_, element_] :=
    If[Head[association[element]] === Missing, 0, association[element]];

unitize[list_List] := N[list / Total[list]];
unitize[association_Association] := Module[{sortedAssociation = KeySort[association], keys, values},
  keys = Keys[sortedAssociation];
  values = unitize[Values[sortedAssociation]];
  Association[MapThread[{#1 -> #2}&, {keys, values}]]
];

associateLists[list1_List, list2_List] := Association[MapThread[{#1 -> #2}&, {list1, list2}]];

associationFunctionMap[associationIn_Association, function_Symbol] :=
    Module[{association = associationIn, keys, values},
      keys = Keys@association; values = function /@ Values@association;
      associateLists[keys, values]];


stringJoinStyled[items_List, buffer_ : ""] := Apply[StringJoin, ToString[#, StandardForm] & /@ Riffle[items, buffer]];
stringJoinBuffer[items_List, buffer_ : ""] := StringJoin @@ Riffle[ToString /@ items, buffer];


pivotedList[list_List] :=
    Module[{pivotPosition, pivotValue, pivotList, prePivotList, postPivotList, skippedRange, length = Length@list, pivotedList},
      pivotPosition = RandomChoice[Range[1, length]];
      pivotValue = list[[pivotPosition]];
      pivotList = {pivotValue};
      prePivotList = {};
      postPivotList = {};
      skippedRange = Delete[Range[length], pivotPosition];

      Table[Piecewise[
        {
          {AppendTo[pivotList, list[[r]]], list[[r]] == pivotValue},
          {AppendTo[prePivotList, list[[r]]], list[[r]] < pivotValue},
          {AppendTo[postPivotList, list[[r]]], list[[r]] > pivotValue}
        }], {r, skippedRange}];
      pivotedList = Join @@ {{postPivotList}, pivotList, {prePivotList}};
      pivotedList
    ];


QuickSortTrack[listIn_List] := Module[{list = {listIn}, pivotOut, tracker = {}},
  While[SomeListQ[list],
    Table[
      If[ListQ[list[[q]]],
        pivotOut = DeleteCases[pivotedList[list[[q]]], {}];
        list = Drop[list, {q}];
        Table[list = Insert[list, pivotOut[[s]], q], {s, 1, Length@pivotOut}]];, {q, 1, Length@list}];
    AppendTo[tracker, Flatten@list];];
  Return@tracker
];

QuickSortTrackRaw[listIn_List] := Module[{list = {listIn}, pivotOut, tracker = {}},
  While[SomeListQ[list],
    Table[
      If[ListQ[list[[q]]],
        pivotOut = DeleteCases[pivotedList[list[[q]]], {}];
        list = Drop[list, {q}];
        Table[list = Insert[list, pivotOut[[s]], q], {s, 1, Length@pivotOut}]];, {q, 1, Length@list}];
    AppendTo[tracker, list];];
  Return@tracker
];

QuickSort[listIn_List] := Module[{list = {listIn}, pivotOut},
  While[SomeListQ[list],
    Table[
      If[ListQ[list[[q]]],
        pivotOut = DeleteCases[pivotedList[list[[q]]], {}];
        list = Drop[list, {q}];
        Table[list = Insert[list, pivotOut[[s]], q], {s, 1, Length@pivotOut}]];, {q, 1, Length@list}];
  ];
  Return@list
];


InsertionSortTrack[list_List] := Module[{listOut = list, temp, i, j, length, track = List[]},
  length = Length@list;
  For[i = 2, i <= length, i++,
    For[j = i, j > 1 && listOut[[j]] < listOut[[j - 1]], j--,
      temp = listOut[[j]];
      listOut[[j]] = listOut[[j - 1]];
      listOut[[j - 1]] = temp;
    ];
    AppendTo[track, listOut];
  ];
  track
];

InsertionSort[list_List] := Module[{listOut = list, temp, i, j, length},
  length = Length@list;
  For[i = 2, i <= length, i++,
    For[j = i, j > 1 && listOut[[j]] < listOut[[j - 1]], j--,
      temp = listOut[[j]];
      listOut[[j]] = listOut[[j - 1]];
      listOut[[j - 1]] = temp;
    ]
  ];
  listOut
];


ShellSortTrack[list_List] := Module[{temp, i, j, h = 1, length, listOut, track = List[]},
  listOut = list;
  length = Length@list;
  While[h < length / 3, h = 3 * h + 1];
  While[h >= 1,
    For[i = h, i < length + 1, i++,
      For[j = i, j >= h && (listOut[[j]] < listOut[[j - h]]), j -= h,
        temp = listOut[[j - h]];
        listOut[[j - h]] = listOut[[j]];
        listOut[[j]] = temp;
      ];
      AppendTo[track, listOut];
    ];
    h = Floor[h / 3];
  ];
  track
];

ShellSort[list_List] := Module[{temp, i, j, h = 1, length, listOut},
  listOut = list;
  length = Length@list;
  While[h < length / 3, h = 3 * h + 1];
  While[h >= 1,
    For[i = h, i < length + 1, i++,
      For[j = i, j >= h && (listOut[[j]] < listOut[[j - h]]), j -= h,
        temp = listOut[[j - h]];
        listOut[[j - h]] = listOut[[j]];
        listOut[[j]] = temp;
      ];
    ];
    h = Floor[h / 3];
  ];
  listOut
];


SelectionSortTrack[list_List] := Module[{listOut = list, min, length, temp, track = List[]},
  length = Length@list;
  For[i = 1, i <= length, i++,
    min = i;
    For[j = i + 1, j <= length, j++,
      If[listOut[[j]] < listOut[[min]], min = j]];
    temp = listOut[[i]];
    listOut[[i]] = listOut[[min]];
    listOut[[min]] = temp;
    AppendTo[track, listOut];
  ];
  track
];


SelectionSort[list_List] := Module[{listOut = list, min, length, temp},
  length = Length@list;
  For[i = 1, i <= length, i++,
    min = i;
    For[j = i + 1, j <= length, j++,
      If[listOut[[j]] < listOut[[min]], min = j]];
    temp = listOut[[i]];
    listOut[[i]] = listOut[[min]];
    listOut[[min]] = temp;
  ];
  listOut
];

FactorialRecursive[n_] :=
    Module[{result},
      If[n == 1 || n == 0, result = 1, result = FactorialRecursive = n * FactorialRecursive[n - 1]];
      result];


ExportSelectionAlgorithm[sortingFunction_Symbol, label_String] :=
    Module[{images, randomData = Join @@ Import[NotebookDirectory[] <> "sorting_data.csv"], durations},
      images = Labeled[
        BarChart[#,
          PlotRange -> {Automatic, {0, 1}},
          FrameTicks -> None,
          AspectRatio -> 1,
          Frame -> True,
          ImageSize -> 300], label, Top] & /@ sortingFunction[randomData];
      durations = ConstantArray[0.2, Length@images];
      durations[[-1]] = 6;
      Export[NotebookDirectory[] <> label <> "_example.gif",
        images,
        "DisplayDurations" -> durations,
        "AnimationRepetitions" -> \[Infinity]]
    ];

ExportSelectionAlgorithmExecute := Module[{functions},
  functions =
      Association@{"Selection_Sort" -> SelectionSortTrack,
        "Insertion_Sort" -> InsertionSortTrack,
        "Shell_Sort" -> ShellSortTrack, "Quick_Sort" -> QuickSortTrack
      };
  MapThread[
    ExportSelectionAlgorithm[#1, #2] &, {Values@functions,
    Keys@functions}]
]

End[];

EndPackage[];
