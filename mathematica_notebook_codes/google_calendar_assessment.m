(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-04-13 *)

googlecalendar = ServiceConnect["GoogleCalendar"];

MapThread[
  With[{\[Delta] = #2},
    Module[{data, tickGrid},
      tickGrid = {DateRange["2010", "2020", Quantity[1.5, #1]], Automatic};
      data = {#["Start"], #["End"], #["Summary"]} & /@ googlecalendar["EventList"];
      Quiet@
          TimelinePlot[
            (Interval[{#[[1]], #[[2]]}] -> #[[3]] & /@
                Select[data, #[[1]] >= DatePlus[Today, -\[Delta]] || StringContainsQ[#[[3]], "IELTS"] &]) ~
                Join ~ {Now -> Style["Now", 15, Red]},
            ImageSize -> 1600,
            DateTicksFormat -> {"Year", "-", "MonthNameShort", "-", "Day", " ", "Hour", ":", "Minute"},
            Frame -> True,
            GridLines -> tickGrid,
            Ticks -> tickGrid,
            PlotRange -> {{DatePlus[Today, -#2 / 4], DatePlus[Today, #2]}, Automatic}]
    ]
  ] &, {{"Days", "Weeks"}, {7, 100}}
] // Column