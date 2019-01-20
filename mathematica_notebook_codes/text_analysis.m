(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2016-12-23 *)

t = ReadList[
  "D:\\Programming\\Learn Python Lynda\\Module 3 - Python 3 \
Essential Learning\\Fibonacci.txt"];
ListLinePlot[
  Table[{m,
    Total[Table[
      StringCount[ToString[t[[n]]], ToString[m]], {n, 1,
        Length[t]}]]}, {m, 0, 9, 1}], PlotRange -> All]

t = Table[Fibonacci[u], {u, 1, 1000}];
ListLinePlot[
  Table[{m,
    Total[Table[
      StringCount[ToString[t[[n]]], ToString[m]], {n, 1,
        Length[t]}]]}, {m, 0, 9}], PlotRange -> All]

t = Table[RandomInteger[{0, u}], {u, 1, 100000}];
ListLinePlot[
  Table[{m,
    Total[Table[
      StringCount[ToString[t[[n]]], ToString[m]], {n, 1,
        Length[t]}]]}, {m, 0, 9}], PlotRange -> All]