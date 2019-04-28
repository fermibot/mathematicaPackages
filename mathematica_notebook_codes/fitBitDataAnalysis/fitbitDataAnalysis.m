Needs["DatabaseLink`"];
ClearAll[stringToTime, weekYearExtract];

stringToTime[dateString_?StringQ] := DateObject[{dateString, {"Month", "//", "Day", "//", "Year", " ", "Hour24", ":", "Minute", ":", "Second"}}, TimeZone -> "America/Chicago"];

weekYearExtract[inString_String] := Module[{yearStart, datePart, year},
  year = StringTake[inString, {1, 4}];
  yearStart = "01-01-" <> year;
  datePart = StringTake[inString, 10];
  year <> "-" <> StringPadLeft[1 + Floor@First@DateDifference[yearStart, datePart, "Week"] // ToString, 2, "0"]
]

Module[{folder =
    "C:\\Users\\Alcatraz\\Downloads\\MyFitbitData\\AshwiniKumarKounduri\\user-site-export\\"},
  First[StringSplit[StringDelete[#, folder], "-"]] & /@
      FileNames["*", folder] // Union // Print;]


Module[{database, data, dataH},
  database =
      OpenSQLConnection[
        JDBC["SQLite", "D:\\Programming\\_databases\\fitbitData.db"]];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\activeMinutes.sql"],
    "ShowColumnHeadings" -> True];
  dataH = First@data;
  data = Rest@data;
  data = GroupBy[{DateObject@#[[1]], #[[2]], #[[3]]} & /@
      data, #[[3]] &];
  data = #[[All, ;; 2]] & /@ data;
  DateListPlot[data, ImageSize -> 1800, AspectRatio -> 0.35,
    Frame -> True,
    FrameTicks -> {data[[1, All, 1]][[;; ;; 15]], Range[0, 500, 25]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[1, All, 1]][[;; ;; 15]], Range[0, 500, 10]},
    FrameLabel -> {"", "Time in Minutes"}, InterpolationOrder -> 1,
    PlotLegends -> Placed[Automatic, Above]]
]

Module[{database, data, dataH, yMin = 0, yMax = 300, ySteps = 10},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\defaultZones.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association@{"IN_DEFAULT_ZONE_1" ->
        Select[data[[All, {1, 2}]], Last@# < 400 &],
      "IN_DEFAULT_ZONE_2" -> data[[All, {1, 3}]],
      "IN_DEFAULT_ZONE_3" -> data[[All, {1, 4}]]}, ImageSize -> 1800,
    AspectRatio -> 0.35, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 12]],
      Range[yMin, yMax, ySteps]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[All, 1]][[;; ;; 4]], Range[yMin, yMax, ySteps]},
    PlotRange -> {All, {0, 300}}, InterpolationOrder -> 1,
    FrameLabel -> {"", "Time in Minutes"}, Filling -> Axis,
    PlotLegends -> Placed[Automatic, Above]]
]


Module[{database, data, dataH, yMin = 0, yMax = 4000, ySteps = 100},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\calories.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[Association[{"Calories" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1800, AspectRatio -> 0.35, Frame -> True,
    FrameTicks -> {Sort[data[[All, 1]]][[;; ;; 12]],
      Range[yMin, yMax, ySteps]},
    GridLines -> {Sort[data[[All, 1]][[;; ;; 3]]],
      Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Automatic}, {Automatic, Opacity[0.4]}},
    FrameLabel -> {"", "Calories"}, InterpolationOrder -> 1]
]

Module[{database, data, dataH, yMin = 60, yMax = 105, ySteps = 2},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\heartRate.sql"]];
  data = {DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[
    Association[{"\[Mu] HeartRate" -> data[[;; , 1 ;; 2]],
      "UpperConfidence" -> data[[;; , {1, 3}]],
      "LowerConfidence" -> data[[;; , {1, 4}]]}], ImageSize -> 1800,
    AspectRatio -> 0.35, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 12]], Range[yMin, yMax]},
    GridLines -> {data[[All, 1]][[;; ;; 3]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}, {Red, Opacity[0.4],
      Thickness@0}, {Green, Opacity[0.4], Thickness@0}},
    Filling -> {1 -> {2}, 1 -> {3}},
    FillingStyle -> {{Opacity@0.1, Red}, {Opacity@0.1}},
    InterpolationOrder -> 2]
]



Module[{database, data, dataH, yMin = 0, yMax = 25000, ySteps = 500},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\steps.sql"]];
  data = SortBy[{DateObject[#[[1]]]} ~ Join ~ Rest[#] & /@ data, #[[1]] &];

  DateListPlot[Association[{"Total Steps" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1800, AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 18]],
      Range[yMin, yMax, ySteps]},
    GridLines -> {data[[All, 1]][[;; ;; 3]], Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Lighter@Blue, Thickness@0.001}}, Filling -> Axis,
    FillingStyle -> LightBlue, InterpolationOrder -> 1]
]

Quiet@Module[{database, data, dataH, yMin = 0, yMax = 100000,
  ySteps = 5000, keys},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_\
notebook_codes\\fitBitDataAnalysis\\steps.sql"]];
  data = KeySort@(GroupBy[{weekYearExtract[#[[1]]], #[[2]]} & /@
      data, #[[1]] &]);
  keys = Keys@data;
  data = Association[(# -> Total[(data[#][[All, 2]])]) & /@ keys];
  BarChart[data,
    ChartLabels ->
        Placed[{Rotate[#, 90 Degree] & /@ (Values@data),
          Rotate[#, 75 Degree] & /@ keys}, {Above, Below}],
    ImageSize -> 1800, AspectRatio -> 0.2, Frame -> True,
    GridLines -> {All, {70000}},
    FrameTicks -> {None, Range[yMin, yMax, ySteps]},
    BarSpacing -> Large]
]