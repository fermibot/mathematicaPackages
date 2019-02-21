(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2016-12-18 *)

Table[n, {n, 1, 6, 1}]

RandomChoice[Table[n, {n, 1, 6, 1}]]

Histogram[RandomChoice[Table[n, {n, 1, 6, 1}], {10000}], 7]

data = Table[{n, n + RandomReal[{-1, 1}]}, {n, 1, 10, 0.1}];
lm = LinearModelFit[data, x, x]
Show[ListPlot[data], Plot[lm[x], {x, 0, 10}], Frame -> True,
  AspectRatio -> 1, ImageSize -> 500]

Mean[RandomChoice[Table[n, {n, 1, 6, 1}], {10000000}]] // N

Mean[{-5, 2, 6, + 20}] // N

list = {-5, 2, 6, + 20};
Table[list[[n]] - Mean[list], {n, 1, 4}] // N

list = {-5, 2, 6, + 20};
Mean[Table[(list[[n]] - Mean[list])^2, {n, 1, 4}] // N]

Manipulate[t = {y, -2, 2, + 20};
Show[Plot[Mean[t], {x, 1, 4}], ListPlot[t],
  PlotRange -> {{1, 4}, {-50, 50}}], {y, -50, 50}]

p = {-5, -2, 2, + 5}

Table[p[[n]] - Mean[p], {n, 1, 4}] // N

Table[(p[[n]] - Mean[p])^2, {n, 1, 4}]

Mean[Table[(p[[n]] - Mean[p])^2, {n, 1, 4}]] // N

Manipulate[t = {y, -2, 2, + 20};
Show[Plot[Mean[t], {x, 1, 4}], ListPlot[t],
  PlotRange -> {{1, 4}, {-200, 50}}], {y, -200, 50}]

Table[n, {n, 1, 6, 1}]

RandomChoice[Table[n, {n, 1, 6, 1}]]

Histogram[
  Table[RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}] + RandomInteger[{1, 6}] +
      RandomInteger[{1, 6}], {1000000}], {1}]

Histogram[
  Table[RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}] +
      RandomInteger[{0, 1}] + RandomInteger[{0, 1}], {100000}], {1}]

a_[#] = RandomInteger[{#, # + 1}]
Histogram[Table[a[, {100000}], {1}]]

f[x_] := RandomInteger[{x, x + 1}];
Histogram[Table[Table[Total[f[1]], {r, 1, 2}], {100000}], {1}]

t = 200;
f[x_] := RandomInteger[{x, x + 1}];
Histogram[Table[Total[Table[f[0], {r, 1, t, 1}]], {10000}], {1}]

PrimeQ[50000017]

