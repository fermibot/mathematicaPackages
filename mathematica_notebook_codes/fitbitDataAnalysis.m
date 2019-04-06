(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-06 *)



Needs["DatabaseLink`"];

ClearAll[stringToTime];
stringToTime[dateString_?StringQ] :=
    DateObject[{dateString, {"Month", "//", "Day", "//", "Year", " ",
      "Hour24", ":", "Minute", ":", "Second"}},
      TimeZone -> "America/Chicago"];

Module[{database, data, dataH},
  database =
      OpenSQLConnection[
        JDBC["SQLite", "D:\\Programming\\_databases\\fitbitData.db"]];
  data = SQLExecute[database,
    "
   	SELECT *, 'Light' AS [ActivityType]
   	FROM lightlyActiveMinutes
   	UNION
   	SELECT *, 'Moderate'
   	FROM moderatelyActiveMinutes
   	UNION
   	SELECT *, 'Very'
   	FROM veryActiveMinutes
   	ORDER BY ActivityType
   ",
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
    GridLines -> {data[[1, All, 1]][[;; ;; 5]], Range[0, 500, 10]}]
]


Module[{database, data, dataH},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database, "SELECT * FROM biometricsCalories"];
  data = Select[{Quiet@stringToTime@#[[1]], #[[2]]} & /@ data,
    DateObjectQ@#[[1]] &];
  DateListPlot[data, ImageSize -> 1600, AspectRatio -> 0.4,
    Frame -> True,
    FrameTicks -> {data[[All, 1]][[;; ;; 75]], Range[0, 500, 25]},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    GridLines -> {data[[All, 1]][[;; ;; 75]], Range[0, 500, 10]}];
  data

]