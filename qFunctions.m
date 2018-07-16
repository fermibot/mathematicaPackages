(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: qFunctions *)
(* :Context: qFunctions` *)
(* :Author: Alcatraz *)
(* :Date: 2018-07-14 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2018 Alcatraz *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["qFunctions`"]
(* Exported symbols added here with SymbolName::usage *)

someListQ::usage="Yields True if any of the elements in the given list are of the form List";

Begin["`Private`"]

someListQ[list_List]:=Or@@(ListQ/@list);


End[] (* `Private` *)

EndPackage[]