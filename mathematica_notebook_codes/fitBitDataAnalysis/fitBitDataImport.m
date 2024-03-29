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
FBDIPlotStepsByDay2::usage = "FBDIPlotStepsByDay2[]";
FBDIPlotStepsByWeek::usage = "Does what the name says";
FBDIPlotHRCaloriesStepsHourly::usage = "Does what the name says";
FBDIPlotHRCaloriesStepsMinutely::usage = "Does what the name says";

Begin["`Private`"];

Needs["DatabaseLink`"];

FBDIDirectory := "D:\\Programming\\mathematicaPackages\\mathematica_notebook_codes\\fitBitDataAnalysis\\";
FBDIDatabasePath := "D:\\Programming\\_databases\\fitbitData.db";
FBDIDatabaseConnection := OpenSQLConnection["fitbit"];
xStepsGlobal = 30;

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


FBDIPlotActiveMinutes[] := Module[{ data, dataH, yMin = 0, yMax = 600, ySteps = 20},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "activeMinutes.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  data = GroupBy[{DateObject@#[[1]], #[[2]], #[[3]]} & /@ data, #[[3]] &];
  data = #[[All, ;; 2]] & /@ data;
  data["Total"] = Transpose[{data[[1, ;;, 1]], Plus @@ (data[[;;, ;;, 2]])}];
  DateListPlot[
    data,
    ImageSize -> 1800,
    AspectRatio -> 0.2,
    Frame -> True,
    FrameTicks -> {data[[1, All, 1]][[;; ;; xStepsGlobal]], Range[yMin, yMax, ySteps]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[1, All, 1]][[;; ;; xStepsGlobal / 5]], Range[yMin, yMax, ySteps]},
    FrameLabel -> {"", "Time in Minutes"},
    InterpolationOrder -> 2,
    PlotLegends -> Placed[Automatic, Above],
    PlotRange -> {All, {0, yMax}}
  ]
];


FBDIPlotDefaultZones[] := Module[{data, dataH, yMin = 0, yMax = 400, ySteps = 10},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "defaultZones.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "IN_DEFAULT_ZONE_1" -> Select[data[[All, {1, 2}]], Last@# < 400 &],
      "IN_DEFAULT_ZONE_2" -> data[[All, {1, 3}]],
      "IN_DEFAULT_ZONE_3" -> data[[All, {1, 4}]]
    },
    ImageSize -> 1800,
    AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; xStepsGlobal]], Range[yMin, yMax, ySteps]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[All, 1]][[;; ;; xStepsGlobal / 5]], Range[yMin, yMax, ySteps]},
    PlotRange -> {All, {0, yMax}}, InterpolationOrder -> 1,
    FrameLabel -> {"", "Time in Minutes"}, Filling -> Axis,
    PlotLegends -> Placed[Automatic, Above]]
];

FBDIPlotCaloriesByDay[] := Module[{data, dataH, yMin = 0, yMax = 5000, ySteps = 200},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "calories.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[Association[{"Calories" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {Sort[data[[All, 1]]][[;; ;; xStepsGlobal]], Range[yMin, yMax, ySteps]},
    GridLines -> {Sort[data[[All, 1]][[;; ;; xStepsGlobal / 5]]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Automatic}, {Automatic, Opacity[0.4]}},
    FrameLabel -> {"", "Calories"}, InterpolationOrder -> 1]
];

FBDIPlotCaloriesByWeek[] := Module[{data, dataH, yMin = 0, yMax = 30000,
  ySteps = 1000, keys},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "caloriesByWeek.sql"]];
  data = Association[(#[[1]] -> #[[2]]) & /@ data];
  keys = data // Keys;
  BarChart[data,
    ChartLabels -> Placed[{Rotate[#, 90 Degree] & /@ (Values@data), Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {None, Range[yMin, yMax, ySteps]},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]},
    BarSpacing -> Large, PlotRange -> {Automatic, {yMin, yMax}}]
];

FBDIPlotHeartRateByDay[] := Module[{data, dataH, yMin = 60, yMax = 105, ySteps = 2},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "heartRate.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "\[Mu] HeartRate" -> data[[;; , 1 ;; 2]],
      "UpperConfidence" -> data[[;; , {1, 3}]],
      "LowerConfidence" -> data[[;; , {1, 4}]]},
    ImageSize -> 1800,
    AspectRatio -> 0.2, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; xStepsGlobal]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; xStepsGlobal / 5]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}, {Red, Opacity[0.4],
      Thickness@0}, {Green, Opacity[0.4], Thickness@0}},
    Filling -> {1 -> {2}, 1 -> {3}},
    FillingStyle -> {{Opacity@0.1, Red}, {Opacity@0.1}},
    InterpolationOrder -> 2]
];

FBDIPlotHeartRateByHour[] := Module[{data, dataH, yMin = 45, yMax = 190, ySteps = 5,
  meanData},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "heartRateByHour.sql"]];
  meanData = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "heartRate.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{
      "\[Mu] HeartRate Daily" -> data,
      "\[Mu] HeartRate Hourly" -> meanData[[;; , 1 ;; 2]],
      "UpperConfidence" -> meanData[[;; , {1, 3}]],
      "LowerConfidence" -> meanData[[;; , {1, 4}]]},
    ImageSize -> 1800, AspectRatio -> 0.5, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 1440]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 1440]], Range[yMin, yMax, ySteps]},
    Joined -> {False, True, True, True},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.0, PointSize@0.001}, {Red}, {Green}, {Green}},
    InterpolationOrder -> 1]
];



FBDIPlotStepsByDay[] := Module[{data, dataH, data2, yMin = 0, yMax = 35000, ySteps = 1000, cumulative},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "steps.sql"]];
  data = SortBy[{DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data, #[[1]] &];
  data2 = data[[;; , 2]];
  data2 = N[Accumulate[data2] / Range[1, Length[data2]]];
  data2 = Transpose[{data[[;; , 1]], data2}];
  DateListPlot[ Association@{"Daily Steps" -> data[[;; , 1 ;; 2]], "Moving Average Steps" -> data2[[;; , 1 ;; 2]]},
    ImageSize -> 1800,
    AspectRatio -> 0.2,
    Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; xStepsGlobal]], Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; xStepsGlobal / 5]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> {"Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Red, Thickness@0.001}, {Lighter@Blue, Thickness@0.001}},
    Filling -> Axis,
    InterpolationOrder -> 1,
    PlotLegends -> Automatic]];

FBDIPlotStepsByDay2[] := Module[{data, dataH, yMin = 0, yMax = 130000, ySteps = 5000,
  keys},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "steps.sql"]];
  data = Association[(#[[1]] -> #[[2]]) & /@ data];
  keys = data // Keys;
  BarChart[data,
    ChartLabels -> Placed[{Rotate[#, 90 Degree] & /@ (Values@data), Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {None, {70000}},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]}, BarSpacing -> Large]
];


FBDIPlotStepsByWeek[] := Module[{ data, dataH, yMin = 0, yMax = 130000, ySteps = 5000, keys},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "stepsByWeek.sql"]];
  data = Association[(#[[1]] -> #[[2]]) & /@ data];
  keys = data // Keys;
  BarChart[data,
    ChartLabels -> Placed[{Rotate[#, 90 Degree] & /@ (Values@data), Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {None, {70000}},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]}, BarSpacing -> Large]
];


FBDIPlotHRCaloriesStepsMinutely := Module[{data, dataH, keys},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "minutely_HR_calories_steps.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  Row@Riffle[
    ListPlot[data[[All, Reverse@#]], AspectRatio -> 1,
      PlotRange -> All, Frame -> True,
      FrameLabel -> dataH[[Reverse@#]], PlotRange -> All,
      ImageSize -> 600] & /@ Subsets[Range@3, {2}], "\t"]
];

FBDIPlotHRCaloriesStepsHourly := Module[{data, dataH, keys},
  data = SQLExecute[FBDIDatabaseConnection, Import[FBDIDirectory <> "Hourly_HR_calories_steps.sql"], "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  Row@Riffle[
    ListPlot[data[[All, Reverse@#]], AspectRatio -> 1,
      PlotRange -> All, Frame -> True,
      FrameLabel -> dataH[[Reverse@#]], PlotRange -> All,
      ImageSize -> 600] & /@ Subsets[Range@3, {2}], "\t"]
];

(*

folder = "C:\\Users\\Alcatraz\\Downloads\\MyFitbitData\\\
AshwiniKumarKounduri\\user-site-export";
data = (#[[2]] & /@ #[[2 ;; 4]]) & /@ Import[#] & /@
     FileNames["*sleep*", folder] // Join @@ # & //
   DateObject /@ # & /@ # &;
function[{a_, b_}] := a + Divide[b, 60];
startTime = {#[[1]], function[#[[2, 1, -3 ;; -2]]],
     UnitConvert[DateDifference @@ #[[2 ;;]],
       MixedUnit[{"Hours"}]][[1, 1, 1]]} & /@ data;
endTime = {#[[1]], #[[2]] + #[[3]]} & /@ startTime;


DateListPlot[{startTime[[;; , {1, 2}]], endTime}, ImageSize -> 1700,
 AspectRatio -> 0.35, Joined -> False,
 PlotStyle -> {PointSize@0.0025}, Filling -> 1 -> {2},
 GridLines -> {None, Range[24]}, Frame -> True,
 FrameTicks -> {DateRange[endTime[[1, 1]], Today, {3, "Weeks"}],
   Range[24]}, DateTicksFormat -> {"Day", "/", "Month", "/", "Year"}]

*)

End[]; (* `Private` *)

EndPackage[];