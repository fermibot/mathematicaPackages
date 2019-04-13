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
        googleCalendar["EventList"];
    TimelinePlot[(Interval[{#[[1]], #[[2]]}] -> #[[3]] & /@
        Select[data, #[[1]] > DatePlus[Today, -\[Delta]] &]) ~
        Join ~ {Now -> Style["Now", 15, Red]}, ImageSize -> 1600,
      DateTicksFormat -> {"Year", "-", "MonthNameShort", "-", "Day"},
      Frame -> True, GridLines -> tickGrid, Ticks -> tickGrid,
      PlotRange -> {{DatePlus[Today, -#2], DatePlus[Today, #2]},
        Automatic}]
  ]] &, {{"Days", "Weeks"}, {20, 100}}] // Column