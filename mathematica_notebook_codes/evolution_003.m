(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: evolution_003 *)
(* :Context: evolution_003` *)
(* :Author: Alcatraz *)
(* :Date: 2019-07-03 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2019 Alcatraz *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["evolution_003`"]
(* Exported symbols added here with SymbolName::usage *)

Begin["`Private`"]

ClearAll[DiskPlotter];
DiskPlotter[list_?ListQ, yPosition_?NumberQ] :=
    MapThread[{GrayLevel@#1, Disk[{#2 + RandomReal[{-0.1, 0.1}], yPosition}, 0.5]} &,
      {list, Range[Length@list]}];

Module[{size = 35, iterations},
  iterations =
      NestWhileList[
        Table[Clip[Max[#] + rand, {0, 1}], {rand,
          RandomReal[{-0.01, 0.01}, size]}] &, ConstantArray[0.5, size],
        Max@# < 1 &];
  Graphics[
    MapThread[
      DiskPlotter[#1, #2] &, {iterations, -Range@Length@iterations}],
    ImageSize -> 1200, Frame -> True, FrameTicks -> False]
];

End[]; (* `Private` *)

EndPackage[];