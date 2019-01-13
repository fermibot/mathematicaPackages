(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

siz = 100000; bs = 20;
data = Table[RandomInteger[{1, 10}], {siz}];
Mean[data] // N
Mean[Table[
  Mean[Table[data[[r]], {r, y, y + bs - 1, 1}]], {y, 1, siz - bs + 1,
    bs}]] // N

Table[Table[data[[r]], {r, y, y + bs - 1, 1}], {y, 1,
  siz - siz / bs + 1, siz / bs}] // N