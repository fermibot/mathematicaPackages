
(*

Hello,

Attached below are some codes samples. You could find more code in any of the pages listed under Heading of this page
https://fermibot.com/sheldon-ross-chapter-3/ or most of the other pages of the site.
If you would like to look more code, please let me know and I can provide you with it.

Thank You
Ashwini Kounduri

*)


(* :OriginalCreationDate: 2018-02-19::Context is explained here https://fermibot.com/josephus-problem/*)

Module[{sequences, alive, replacer},
  alive[1] := Style[1, Darker@Hue[0.3], 10];
  alive[0] := Style[0, Red, 10];
  replacer[obj_] := obj -> obj - 1;
  sequences =
      Module[{list = Range[100], lists, deleter = 1}, lists = {list};

      While[Length[list] > 1,
        list = Delete[list, deleter + 1];
        deleter = Mod[deleter + 1, Length@list];
        AppendTo[lists, list]];

      Print@TableForm[
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}], TableSpacing -> {0, 0}]]]

Module[{sequences, alive, replacer, colors, images}, alive[1] := Green;
alive[0] := Red;
replacer[obj_] := obj -> obj - 1;
sequences =
    Module[{list = Range[100], lists, deleter = 1}, lists = {list};
    While[Length[list] > 1, list = Delete[list, deleter + 1];
    deleter = Mod[deleter + 1, Length@list];
    AppendTo[lists, list]];
    colors =
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}];
    images =
        Table[Graphics[{Table[{colors[[r, n]],
          Disk[{35 Sin[2 \[Pi] n / 100], 35 Cos[2 \[Pi] n / 100]}]}, {n, 1,
          Length@lists[[1]]}],
          Table[Style[
            Text[n, {35 Sin[2 \[Pi] n / 100], 35 Cos[2 \[Pi] n / 100]}],
            Black], {n, 1, Length@lists[[1]]}]}, ImageSize -> 700], {r,
          1, 100}];
    Export["100_men_standing.gif", images,
      "DisplayDurations" -> Table[0.4, 99] ~ Join ~ {5},
      AnimationRepetitions -> 20]]]

(*k=5*)
Module[{sequences, alive, replacer},
  alive[1] := Style[1, Darker@Hue[0.3], 10];
  alive[0] := Style[0, Red, 10];
  replacer[obj_] := obj -> obj - 1;
  sequences =
      Module[{list = Range[100], lists, deleter = 1}, lists = {list};

      While[Length[list] > 1,
        list = Delete[list, Mod[deleter + 1, Length@list + 1]];
        deleter = Mod[deleter + 4, Length@list];
        AppendTo[lists, list]];

      Print@TableForm[
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}], TableSpacing -> {0, 0}]]]


(**********************************************************************************************************************)
(* The following mathematica Package imports data from a Python-Managed SQLite Database.
Then it plots various parameters. The SQL code for one of the functions of the package is shown below this line


              WITH HeartRateByHour AS (SELECT strftime('%Y-%m-%d %H:00:00',
                                                       dateTimeID) AS Hour,
                                              avg(bpm)                AvgHeartRate
                                       FROM heartRate
                                       GROUP BY Hour),

                   CaloriesByHour AS (SELECT strftime('%Y-%m-%d %H:00:00',
                                                      dateTimeID) AS Hour,
                                             sum(calories)           TotalCalories
                                      FROM calories
                                      GROUP BY Hour),

                   StepsByHour AS (SELECT strftime('%Y-%m-%d %H:00:00', dateTimeID)
                                                     AS Hour,
                                          sum(steps) AS TotalSteps
                                   FROM steps
                                   GROUP BY hour)
              SELECT AvgHeartRate
                   , TotalCalories
                   , TotalSteps
              FROM HeartRateByHour
                     LEFT OUTER JOIN CaloriesByHour ON CaloriesByHour.Hour = HeartRateByHour.Hour
                     LEFT OUTER JOIN StepsByHour ON StepsByHour.hour = HeartRateByHour.Hour
              WHERE TotalCalories IS NOT NULL
              ORDER BY StepsByHour.Hour DESC

*)


BeginPackage["fitBitDataImport`"];

FBDIGetRecordTypes::usage = "Gets the list of types of the files that are available in the fitBit zip download";
FBDIPlotActiveMinutes::usage = "Does what the name says";
FBDIPlotDefaultZones::usage = "Does what the name says";
FBDIPlotCaloriesByDay::usage = "Does what the name says";
FBDIPlotCaloriesByWeek::usage = "Does what the name says";
FBDIPlotHeartRateByDay::usage = "Does what the name says";
FBDIPlotHeartRateByHour::usage = "Does what the name says";
FBDIPlotStepsByDay::usage = "Does what the name says";
FBDIPlotStepsByWeek::usage = "Does what the name says";
FBDIPlotHRCaloriesStepsHourly::usage = "Does what the name says";
FBDIPlotHRCaloriesStepsMinutely::usage = "Does what the name says";

Begin["`Private`"];

Needs["DatabaseLink`"];

FBDIDirectory := "D:\\Programming\\mathematicaPackages\\mathematica_notebook_codes\\fitBitDataAnalysis\\";
FBDIDatabasePath := "D:\\Programming\\_databases\\fitbitData.db";
FBDIDatabaseConnection := OpenSQLConnection["fitbit"];

stringToTime[dateString_?StringQ] :=
    DateObject[{dateString, {"Month", "//", "Day", "//", "Year", " ",
      "Hour24", ":", "Minute", ":", "Second"}},
      TimeZone -> "America/Chicago"];

weekYearExtract[inString_String] := Module[{yearStart, datePart, year},
  year = StringTake[inString, {1, 4}];
  yearStart = "01-01-" <> year;
  datePart = StringTake[inString, 10];
  year <> "-" <>
      StringPadLeft[
        1 + Floor@First@DateDifference[yearStart, datePart, "Week"] //
            ToString, 2, "0"]
];

FBDIGetRecordTypes[] := Module[{folder =
    "C:\\Users\\Alcatraz\\Downloads\\MyFitbitData\\AshwiniKumarKounduri\\user-site-export\\"},
  First[StringSplit[StringDelete[#, folder], "-"]] & /@ FileNames["*", folder] // Union];


FBDIPlotActiveMinutes[] := Module[{database, data, dataH, yMin = 0, yMax = 500, ySteps = 20},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "activeMinutes.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  data = GroupBy[{DateObject@#[[1]], #[[2]], #[[3]]} & /@ data, #[[3]] &];
  data = #[[All, ;; 2]] & /@ data;
  DateListPlot[
    data,
    ImageSize -> 1800,
    AspectRatio -> 0.2,
    Frame -> True,
    FrameTicks -> {data[[1, All, 1]][[;; ;; 15]], Range[yMin, yMax, ySteps]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[1, All, 1]][[;; ;; 15]], Range[yMin, yMax, ySteps]}, FrameLabel -> {"", "Time in Minutes"},
    InterpolationOrder -> 2, PlotLegends -> Placed[Automatic, Above]]
];


FBDIPlotDefaultZones[] := Module[{database, data, dataH, yMin = 0, yMax = 300, ySteps = 10},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "defaultZones.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "IN_DEFAULT_ZONE_1" -> Select[data[[All, {1, 2}]], Last@# < 400 &],
      "IN_DEFAULT_ZONE_2" -> data[[All, {1, 3}]],
      "IN_DEFAULT_ZONE_3" -> data[[All, {1, 4}]]
    },
    ImageSize -> 1800,
    AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 12]], Range[yMin, yMax, ySteps]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[All, 1]][[;; ;; 4]], Range[yMin, yMax, ySteps]},
    PlotRange -> {All, {0, 300}}, InterpolationOrder -> 1,
    FrameLabel -> {"", "Time in Minutes"}, Filling -> Axis,
    PlotLegends -> Placed[Automatic, Above]]
];

FBDIPlotCaloriesByDay[] := Module[{database, data, dataH, yMin = 0, yMax = 4400, ySteps = 200},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "calories.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[Association[{"Calories" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {Sort[data[[All, 1]]][[;; ;; 12]], Range[yMin, yMax, ySteps]},
    GridLines -> {Sort[data[[All, 1]][[;; ;; 3]]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Automatic}, {Automatic, Opacity[0.4]}},
    FrameLabel -> {"", "Calories"}, InterpolationOrder -> 1]
];

FBDIPlotCaloriesByWeek[] := Module[{database, data, dataH, yMin = 0, yMax = 25000,
  ySteps = 1000, keys},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "caloriesByWeek.sql"]];
  data = Association[(#[[1]] -> #[[2]]) & /@ data];
  keys = data // Keys;
  BarChart[data,
    ChartLabels -> Placed[{Rotate[#, 90 Degree] & /@ (Values@data), Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {None, Range[yMin, yMax, ySteps]},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]},
    BarSpacing -> Large, PlotRange -> {Automatic, {yMin, yMax}}]
];

FBDIPlotHeartRateByDay[] := Module[{database, data, dataH, yMin = 60, yMax = 105, ySteps = 2},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "heartRate.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "\[Mu] HeartRate" -> data[[;; , 1 ;; 2]],
      "UpperConfidence" -> data[[;; , {1, 3}]],
      "LowerConfidence" -> data[[;; , {1, 4}]]},
    ImageSize -> 1800,
    AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 12]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 3]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}, {Red, Opacity[0.4],
      Thickness@0}, {Green, Opacity[0.4], Thickness@0}},
    Filling -> {1 -> {2}, 1 -> {3}},
    FillingStyle -> {{Opacity@0.1, Red}, {Opacity@0.1}},
    InterpolationOrder -> 2]
];

FBDIPlotHeartRateByHour[] := Module[{database, data, dataH, yMin = 45, yMax = 190, ySteps = 5,
  meanData},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "heartRateByHour.sql"]];
  meanData = SQLExecute[database, Import[FBDIDirectory <> "heartRate.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "\[Mu] HeartRate Daily" -> data,
      "\[Mu] HeartRate Hourly" -> meanData[[;; , 1 ;; 2]],
      "UpperConfidence" -> meanData[[;; , {1, 3}]],
      "LowerConfidence" -> meanData[[;; , {1, 4}]]},
    ImageSize -> 1800, AspectRatio -> 0.5, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 288]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 144]], Range[yMin, yMax, ySteps]},
    Joined -> {False, True, True, True},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.0, PointSize@0.001}, {Red}, {Green}, {Green}},
    InterpolationOrder -> 1]
];



FBDIPlotStepsByDay[] := Module[{database, data, dataH, yMin = 0, yMax = 25000, ySteps = 1000},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "steps.sql"]];
  data = SortBy[{DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data, #[[1]] &];
  DateListPlot[Association@{"Total Steps" -> data[[;; , 1 ;; 2]]},
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 18]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 3]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}}, Filling -> Axis,
    FillingStyle -> LightBlue, InterpolationOrder -> 1]
];

FBDIPlotStepsByWeek[] := Module[{database, data, dataH, yMin = 0, yMax = 100000, ySteps = 5000,
  keys},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "stepsByWeek.sql"]];
  data = Association[(#[[1]] -> #[[2]]) & /@ data];
  keys = data // Keys;
  BarChart[data,
    ChartLabels -> Placed[{Rotate[#, 90 Degree] & /@ (Values@data), Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {None, {70000}},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]}, BarSpacing -> Large]
];


FBDIPlotHRCaloriesStepsMinutely := Module[{database, data, dataH, keys},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "minutely_HR_calories_steps.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  Row@Riffle[
    ListPlot[data[[All, Reverse@#]], AspectRatio -> 1,
      PlotRange -> All, Frame -> True,
      FrameLabel -> dataH[[Reverse@#]], PlotRange -> All,
      ImageSize -> 600] & /@ Subsets[Range@3, {2}], "\t"]
];

FBDIPlotHRCaloriesStepsHourly := Module[{database, data, dataH, keys},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, Import[FBDIDirectory <> "Hourly_HR_calories_steps.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  Row@Riffle[
    ListPlot[data[[All, Reverse@#]], AspectRatio -> 1,
      PlotRange -> All, Frame -> True,
      FrameLabel -> dataH[[Reverse@#]], PlotRange -> All,
      ImageSize -> 600] & /@ Subsets[Range@3, {2}], "\t"]
];

End[]; (* `Private` *)

EndPackage[];


(**********************************************************************************************************************)
(* :Title: proximity_finder *)
(* :Context: proximity_finder` *)

(*This one below was a code I was experimenting with a while back to locate objects in the vicinity of given coordinates*)

proximityFinder[np_Integer, list_List] := Module[{npts, pts, proxp},
  If[np <= Length[list], npts = np, npts = Length[list]];
  pts = RandomSample[list, npts]; proxp = {};
  Table[If[(Norm[{{0, 0}, list[[n]]}] <
      0.5) || (Norm[{{0, 0}, list[[n]]}] > .95),
    proxp = Join[proxp, {list[[n]]}]], {n, 1, Length[list]}];
  Graphics[{{Opacity[0.2], Green, PointSize[0.001],
    Point[proxp]}, {Opacity[1], Red, PointSize[0.01],
    Point[{0, 0}]}}, AspectRatio -> 1, ImageSize -> 600,
    PlotRange -> {{-1, 1}, {-1, 1}}]]
proximityFinder[1, RandomReal[{-1, 1}, {150000, 2}]]

proximityFinder[np_Integer, list_List, lines_ : True] :=
    Module[{npts, pts, proxp, ptsch},
      If[np <= Length[list], npts = np, npts = Length[list]];
      pts = RandomSample[list, npts]; proxp = {}; ptsch = pts[[1]];
      Table[If[EuclideanDistance[pts[[r]], list[[n]]] < .1,
        proxp = Union[proxp, {list[[n]]}]], {n, 1, Length[list]}, {r, 1,
        Length[pts]}];
      Graphics[{{Blue, PointSize[0.001], Point[proxp]}, {Opacity[1], Blue,
        PointSize[0.01], Point[pts]}, {Lighter[Green],
        Line[pts[[Last[FindShortestTour[pts]]]]]}}, AspectRatio -> 1,
        ImageSize -> 600, PlotRange -> {{-1, 1}, {-1, 1}}]]
proximityFinder[60, RandomReal[{-1, 1}, {10000, 2}]]



(**********************************************************************************************************************)
(*I made this utilities package to manage some of my most used functions and methods*)

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
pivotedList::usage = "Supporting function needed for QuickSort";

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

FactorialRecursive[n_] :=
    Module[{result},
      If[n == 1, result = 1, result = FactorialRecursive = n * FactorialRecursive[n - 1]];
      result];

End[];

EndPackage[];

(**********************************************************************************************************************)
(*As mentioned in the beginning, if you would like more samples, please let me know*)