(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: lists *)
(* :Context: lists` *)
(* :Author: Fermibot *)
(* :Date: 2018-09-10 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2018 Fermibot *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["lists`"]

listProportion::usage = "Finds the proportion of the element(s) in a given list";

Begin["`Private`"]

listProportion[list_List, element_] := Count[list, element] / Length[list]
listProportion[list_List, elements_List] := Count[list, Alternatives @@ elements] / Length[list]

End[] (* `Private` *)

EndPackage[]