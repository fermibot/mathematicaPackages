(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Module[{data = RandomReal[{-1, 1}, {100000, 2}]},
  Graphics[{
    {Red, PointSize@.0025,
      Point[Select[data, Sqrt[#[[1]]^2 + #[[2]]^2] <= 1 &]]},
    {Green, PointSize@.0025,
      Point[Select[data, Sqrt[#[[1]]^2 + #[[2]]^2] > 1 &]]}
  }
    , ImageSize -> 800]]