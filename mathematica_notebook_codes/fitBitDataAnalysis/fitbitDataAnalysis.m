(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-06 *)

Needs["DatabaseLink`"];
ClearAll[stringToTime];
stringToTime[dateString_?StringQ] := DateObject[{dateString, {"Month", "//", "Day", "//", "Year", " ", "Hour24", ":", "Minute", ":", "Second"}}, TimeZone -> "America/Chicago"];


Module[{folder =
    "C:\\Users\\Alcatraz\\Downloads\\MyFitbitData\\\
AshwiniKumarKounduri\\user-site-export\\"},
  First[StringSplit[StringDelete[#, folder], "-"]] & /@
      FileNames["*", folder] // Union // Print;]

Module[{database, data, dataH},
  database =
      OpenSQLConnection[
        JDBC["SQLite", "D:\\Programming\\_databases\\fitbitData.db"]];
  data = SQLExecute[database,
    Import[NotebookDirectory[] <> "activeMinutes.txt"],
    "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  data = GroupBy[{stringToTime@#[[1]], #[[2]], #[[3]]} & /@
      data, #[[3]] &];
  data = #[[All, ;; 2]] & /@ data;
  DateListPlot[data, ImageSize -> 1600, AspectRatio -> 0.4,
    Frame -> True,
    FrameTicks -> {data[[1, All, 1]][[;; ;; 10]], Range[0, 500, 25]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[1, All, 1]][[;; ;; 5]], Range[0, 500, 10]},
    FrameLabel -> {"", "Time in Minutes"}]
]

Module[{database, data, dataH},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import[NotebookDirectory[] <> "defaultZones.txt"]];
  data = {stringToTime[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{"IN_DEFAULT_ZONE_1" ->
        Select[data[[All, {1, 2}]], Last@# < 400 &],
      "IN_DEFAULT_ZONE_2" -> data[[All, {1, 3}]],
      "IN_DEFAULT_ZONE_3" -> data[[All, {1, 4}]](*,
    "BELOW_DEFAULT_ZONE_1"\[Rule]data[[All,{1,5}]]*)},
    ImageSize -> 1600, AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 10]], Range[0, 300, 25]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[All, 1]][[;; ;; 2]], Range[0, 300, 25]},
    PlotRange -> {All, {0, 300}}, InterpolationOrder -> 2,
    FrameLabel -> {"", "Time in Minutes"}]
]

Module[{database, data, dataH, yMin = 0, yMax = 3, ySteps = 0.1},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import[NotebookDirectory[] <> "calories.txt"]];
  data = {stringToTime[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association[{"\[Mu] Calories" -> data[[;; , 1 ;; 2]],
      "\[Sigma] Calories" -> data[[;; , {1, 3}]]}], ImageSize -> 1600,
    AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {Sort[data[[All, 1]]][[;; ;; 9]],
      Range[yMin, yMax, ySteps]},
    GridLines -> {Sort[data[[All, 1]][[;; ;; 3]]],
      Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Automatic}, {Automatic, Opacity[0.4]}},
    FrameLabel -> {"", "Mean Calories"}, InterpolationOrder -> 2]
]

Module[{database, data, dataH, yMin = 60, yMax = 105, ySteps = 2},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import[NotebookDirectory[] <> "heartRate.txt"]];
  data = {stringToTime[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association[{"\[Mu] HeartRate" -> data[[;; , 1 ;; 2]],
      "UpperConfidence" -> data[[;; , {1, 3}]],
      "LowerConfidence" -> data[[;; , {1, 4}]]}], ImageSize -> 1600,
    AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 9]], Range[yMin, yMax]},
    GridLines -> {data[[All, 1]][[;; ;; 9]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}, {Red, Opacity[0.4],
      Thickness@0}, {Green, Opacity[0.4], Thickness@0}},
    Filling -> {1 -> {2}, 1 -> {3}},
    FillingStyle -> {{Opacity@0.1, Red}, {Opacity@0.1}},
    InterpolationOrder -> 2]
]

Module[{database, data, dataH, yMin = 0, yMax = 25000, ySteps = 1000},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import[NotebookDirectory[] <> "steps.txt"]];
  data = SortBy[{stringToTime[#[[1]]]} ~ Join ~ Rest[#] & /@
      data, #[[1]] &];

  DateListPlot[Association[{"Total Steps" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1600, AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 9]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 9]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}, {Red, Opacity[0.4],
      Thickness@0}, {Green, Opacity[0.4], Thickness@0}},
    Filling -> Axis, FillingStyle -> LightBlue, InterpolationOrder -> 2]
]