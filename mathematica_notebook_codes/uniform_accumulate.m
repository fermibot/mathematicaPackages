(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

data = Table[Accumulate@Table[RandomReal[{-1, 1}], 100], 1000000];
Histogram[Table[data[[n, 100]], {n, 1, Length@data}]]