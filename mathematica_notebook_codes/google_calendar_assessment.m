(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-13 *)

googleCalendar = ServiceConnect["GoogleCalendar"];

MapThread[
  With[{\[Delta] = #2}
    , Module[{data, tickGrid},
    tickGrid = {DateRange["2010", "2020", Quantity[2, #1]],
      Automatic};
    data = {#["Start"], #["End"], #["Summary"]} & /@
        googlecalendar["EventList"];
    TimelinePlot[(Interval[{#[[1]], #[[2]]}] -> #[[3]] & /@
        Select[data, #[[1]] > DatePlus[Today, -\[Delta]] && !
            StringContainsQ[#[[3]], "IELTS"] &]) ~
        Join ~ {Now -> Style["Now", 15, Red]}, ImageSize -> 1600,
      DateTicksFormat -> {"Year", "-", "MonthNameShort", "-", "Day",
        " ", "Hour", ":", "Minute"}, Frame -> True,
      GridLines -> tickGrid, Ticks -> tickGrid,
      PlotRange -> {{DatePlus[Today, -#2 / 4], DatePlus[Today, #2]},
        Automatic}]
  ]] &, {{"Days", "Weeks"}, {7, 100}}] // Column


Module[{database, data, dataH, yMin = 0, yMax = 4200, ySteps = 100},
  database = OpenSQLConnection["fitbit"];
  data = SQLExecute[database,
    Import["D:\\Programming\\mathematicaPackages\\mathematica_notebook_\
codes\\fitBitDataAnalysis\\calories.sql"]];
  data = {stringToTime[#[[1]]]} ~ Join ~ Rest[#] & /@ data;
  DateListPlot[Association[{"Calories" -> data[[;; , 1 ;; 2]]}],
    ImageSize -> 1600, AspectRatio -> 0.4, Frame -> True,
    FrameTicks -> {Sort[data[[All, 1]]][[;; ;; 9]],
      Range[yMin, yMax, ySteps]},
    GridLines -> {Sort[data[[All, 1]][[;; ;; 3]]],
      Range[yMin, yMax, ySteps]},
    PlotRange -> {Automatic, {yMin, yMax}},
    DateTicksFormat -> { "Day", "/", "MonthNameShort", "/", "Year"},
    PlotStyle -> {{Automatic}, {Automatic, Opacity[0.4]}},
    FrameLabel -> {"", "Calories"}, InterpolationOrder -> 1]
]
