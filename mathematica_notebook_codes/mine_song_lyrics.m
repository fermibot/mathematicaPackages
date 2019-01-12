(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Module[{homepage = "https://www.azlyrics.com/", firstPage, firstPages,
  uselessPages, alphabet},
  firstPage = Import[homepage, "Hyperlinks"];
  firstPages = firstPage[[2 ;; 27]];
  alphabet = Alphabet[];

  Table[Select[
    Flatten[Import["https:" <> #, "Hyperlinks"] & /@ {firstPages[[
        r]]}], StringContainsQ[#, "/" <> alphabet[[r]] <> "/"] &], {r,
    1, 26}]

]