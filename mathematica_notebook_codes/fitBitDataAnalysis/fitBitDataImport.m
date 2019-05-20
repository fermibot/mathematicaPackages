(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: fitBitDataImport *)
(* :Context: fitBitDataImport` *)
(* :Author: Alcatraz *)
(* :Date: 2019-05-19 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2019 Alcatraz *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["fitBitDataImport`"];
(* Exported symbols added here with SymbolName::usage *)

FBDIGetRecordTypes::usage = "Gets the list of types of the files that are available in the fitBit zip download";
FBDIPlotActiveMinutes::usage = "Does what the name says";
FBDIPlotDefaultZones::usage = "Does what the name says";
FBDIPlotCaloriesByDay::usage = "Does what the name says";
FBDIPlotCaloriesByWeek::usage = "Does what the name says";
FBDIPlotHeartRateByDay::usage = "Does what the name says";
FBDIPlotHeartRateByHour::usage = "Does what the name says";
FBDIPlotStepsByDay::usage = "Does what the name says";
FBDIPlotStepsByWeek::usage = "Does what the name says";

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


End[]; (* `Private` *)

EndPackage[];