(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-20 *)


googleCalendar = ServiceConnect["GoogleCalendar"];

Module[{data, tickGrid},
  tickGrid = {DateRange["2019", "2020", Quantity[0.5, "Days"]], None};
  data = {#["Start"], #["End"], #["Summary"]} & /@
      googleCalendar["EventList"];
  TimelinePlot[({Interval[{#[[1]], #[[2]]}] -> #[[3]]} & /@
      Select[data, #[[1]] >= DateObject[{2019, 07, 03, 00, 00}] &]) ~
      Join ~ {Now -> Style["Now", 15, Red]}, ImageSize -> 1600,
    DateTicksFormat -> {"Year", "-", "MonthNameShort", "-", "Day", " ",
      "Hour", ":", "Minute"}, Frame -> True, GridLines -> tickGrid,
    Ticks -> tickGrid,
    PlotRange -> {{"2019-07-03", "2019-07-09"}, Automatic}]
]