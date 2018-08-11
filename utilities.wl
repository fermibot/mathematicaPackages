(* ::Package:: *)

BeginPackage["utilities`"];


accumulatingMean::usage = "Calculates the accumulating range of a list";
stringJoinStyled::usage = "Joins a list of styled string objects";
stringJoinBuffer::usage = "Joins a list of strings with a buffer in between them for spacing";


associator::usage = "Takes an element and converts into a an association with a value of 1";
associationAppender::usage = "A complex AppendTo, looks if the element the element passed already exists, If it does, it increments by that amount, if not, simply appends it.";
valuesMissing::usage = "Additional layer over Values to handle non-existent entries";


QuickSort::usage = "Fermibot's Mathematica implementation of Quick-Sort algorithm";
QuickSortTrack::usage = "It's again QuickSort but it shows the progress of the sorting mechanism";
pivotedList::usage = "Supporting function needed for QuickSort";


Begin["Private`"];
Needs["qFunctions`"];

accumulatingMean[list_List] := N[Accumulate[list] / Range[1, Length[list]]]

stringJoinStyled[items_List, buffer_ : ""] := Apply[StringJoin, ToString[#, StandardForm] & /@ Riffle[items, buffer]]
stringJoinBuffer[items_List, buffer_ : ""] := StringJoin @@ Riffle[ToString /@ items, buffer]


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
    ]


associationAppender[list_List] :=
    Module[{seedAssociation = <||>},
      Table[seedAssociation =
          associationAppender[seedAssociation, list[[r]]], {r, 1,
        Length@list}]]


valuesMissing[association_, element_] :=
    If[Head[association[element]] === Missing, 0, association[element]]



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
  While[someListQ[list],
    Table[
      If[ListQ[list[[q]]],
        pivotOut = DeleteCases[pivotedList[list[[q]]], {}];
        list = Drop[list, {q}];
        Table[list = Insert[list, pivotOut[[s]], q], {s, 1, Length@pivotOut}]];, {q, 1, Length@list}];
    AppendTo[tracker, list];];
  Return@tracker
];

QuickSort[listIn_List] := Module[{list = {listIn}, pivotOut},
  While[someListQ[list],
    Table[
      If[ListQ[list[[q]]],
        pivotOut = DeleteCases[pivotedList[list[[q]]], {}];
        list = Drop[list, {q}];
        Table[list = Insert[list, pivotOut[[s]], q], {s, 1, Length@pivotOut}]];, {q, 1, Length@list}];
  ];
  Return@list
];

End[];

EndPackage[];
