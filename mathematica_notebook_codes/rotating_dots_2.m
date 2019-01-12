(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Graphics[
  Table[
    Disk[{m Sin[Divide[n, m]], m Cos[Divide[n, m]]}, 0.1], {n, 0.2 \[Pi], 2 \[Pi], 0.2 \[Pi]},
    {m, 1, 4}]]