(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)
(* :OriginalCreationDate: 2017-03-01 *)

u16807[iseed_] := Mod[(iseed) * 16807, 2147483647];
dice[u_] := If[u <= 1 / 6, 1,
  If[u > 1 / 6 && u <= 2 / 6, 2,
    If[u > 2 / 6 && u <= 3 / 6, 3,
      If[u > 3 / 6 && u <= 4 / 6, 4,
        If[u > 4 / 6 && u <= 5 / 6, 5,
          If[u > 5 / 6 && u <= 6 / 6, 6]]]]]];
a = Table[Histogram[Table[
  iseed1 = u16807[iseed1];
  iseed2 = u16807[iseed2];
  iseed3 = u16807[iseed3];
  dice[iseed1 / 2147483647] + dice[iseed2 / 2147483647] +
      dice[iseed3 / 2147483647], {n, 1, 10^t}], {1}, ImageSize -> 700,
  ChartStyle -> "Pastel",
  PlotLabel ->
      Style[StringJoin["Distribution for ", ToString[10^t],
        " iterations"], Lighter[Blue], 20]], {t, 1, 6}];
Export["Dice.gif", a, "DisplayDurations" -> 1.2]

iseed1 = 1;
iseed2 = 1.5;
iseed3 = 2.15;
u16807[iseed_] := Mod[(iseed) * 16807, 2147483647];
;
a = Table[Histogram[Table[
  iseed1 = u16807[iseed1];
  iseed2 = u16807[iseed2];
  dice[iseed1 / 2147483647] + dice[iseed2 / 2147483647], {n, 1, 10^t}],
  ImageSize -> 700, ChartStyle -> "Pastel",
  PlotLabel ->
      Style[StringJoin["Distribution for ", ToString[10^t],
        " iterations"], Lighter[Blue], 20]], {t, 1, 6}];
Export["Dice_2.gif", a, "DisplayDurations" -> 1.2]

Histogram[Table[
  dice[RandomReal[]] + dice[RandomReal[]], {n, 1, 1000000}],
  ImageSize -> 700, ChartStyle -> "Pastel",
  PlotLabel ->
      Style[StringJoin["Distribution for ", ToString[10^t],
        " iterations"], Lighter[Blue], 20]]

dice[u_] := If[u <= 1 / 6, 1,
  If[u > 1 / 6 && u <= 2 / 6, 2,
    If[u > 2 / 6 && u <= 3 / 6, 3,
      If[u > 3 / 6 && u <= 4 / 6, 4,
        If[u > 4 / 6 && u <= 5 / 6, 5,
          If[u > 5 / 6 && u <= 6 / 6, 6]]]]]];


a = Histogram[Table[
  dice[RandomReal[]] + dice[RandomReal[]], {n, 1, 1000000}],
  ImageSize -> 700, ChartStyle -> "Pastel",
  PlotLabel ->
      Style[StringJoin["Distribution for ", ToString[1000000],
        " iterations"], Lighter[Blue], 20]]
Export["DICE_2.png", a, ImageSize -> 700]


no = 1; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 2; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 3; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 4; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 5; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 6; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]

no = 7; siz = {700, 2000};
Table[a =
    Histogram[
      Table[Total[Table[dice[RandomReal[]], {n, 1, no, 1}]], {n, 1,
        1000000}], ImageSize -> 700, ChartStyle -> "Pastel",
      PlotLabel ->
          Style[StringJoin["Distribution for ", ToString[1000000],
            " iterations"], Lighter[Blue], 20]];
Export[StringJoin["DICE_0", ToString[no], "_size",
  ToString[siz[[r]]], ".png"], a, ImageSize -> siz[[r]]], {r, 1, 2}]