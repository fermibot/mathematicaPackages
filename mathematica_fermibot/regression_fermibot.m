(* :Title: regression_fermibot *)
(* :Context: regression_fermibot` *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-14 *)
(* :OriginalCreateDate: 2019-02-21 *)


po = Table[{x, x + RandomReal[{-0.5, 0.2}]}, {x, 0, 5, 0.1}];
f[x_, y_] := Mean[Table[(x - y), {n, 1, Length[po]}]];
Manipulate[
  Graphics[Point[po], PlotRange -> {{-3, 3}, {-3, 3}}], {n, 1, 3}]

po = Table[{x, x + RandomReal[{-0.5, 0.5}]}, {x, 0, 5, 0.05}];
f[po_, m_, c_] :=
    Mean[Table[(m po[[n, 1]] + c - po[[n, 2]])^2, {n, 1, Length[po]}]];
mx = 5;
Manipulate[Graphics[
  {
    {PointSize[0.005], Red, Point[po]},
    {Green, Line[{{0, c}, {mx, mx + c}}]},
    Table[{Thickness[0], Blue,
      Line[{po[[n]], {po[[n, 1]], po[[n, 1]] + c}}]}, {n, 1,
      Length[po]}]
  },
  PlotLabel ->
      Style[StringJoin["Mean square distance from the line: ",
        ToString[f[po, 1, c]]], Red, 15],
  PlotRange -> {{-1, 6}, {-2, 7}}, Axes -> True,
  GridLines -> {Table[m, {m, -1, 6, 1}],
    Table[m, {m, -2, 7, 1}]}], {c, -1, 1}]

po = Table[{x, x + RandomReal[{-0.5, 0.5}]}, {x, 0, 5, 0.05}];
f[po_, m_, c_] :=
    Mean[Table[(m po[[n, 1]] + c - po[[n, 2]])^2, {n, 1, Length[po]}]];
mx = 5;
reg = Table[Graphics[
  {
    {PointSize[0.005], Red, Point[po]},
    {Green, Line[{{0, c}, {mx, mx + c}}]},
    Table[{Thickness[0], Blue,
      Line[{po[[n]], {po[[n, 1]], po[[n, 1]] + c}}]}, {n, 1,
      Length[po]}]
  },
  PlotLabel ->
      StringJoin["Mean square distance from the line: ",
        ToString[f[po, 1, c]]],
  PlotRange -> {{-1, 6}, {-2, 7}}, Axes -> True,
  GridLines -> {Table[m, {m, -1, 6, 0.5}],
    Table[m, {m, -2, 7, 0.5}]}], {c, -2, 2, 0.01}];
Export["Reg_Animation.gif", reg, ImageSize -> 700]