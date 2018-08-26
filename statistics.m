(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: statistics *)
(* :Context: statistics` *)
(* :Author: Fermibot *)
(* :Date: 2018-08-16 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2018 Fermibot *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["statistics`"]
(* Exported symbols added here with SymbolName::usage *)

unitize::"Takes in a list(association) and returns a list(association) whose sum(sum of values) equals one ";
associateLists::"Takes two lists and MapThreads the first list to the second one and creates an association of of it";

Begin["`Private`"]

unitize[list_List] := N[list / Total[list]]
unitize[association_Association] := Module[{sortedAssociation = KeySort[association],keys,values},
  keys = Keys[sortedAssociation];
  values = unitize[Values[sortedAssociation]];
  Association[MapThread[{#1->#2}&,{keys,values}]]
]

associateLists[list1_List,list2_List]:=Association[MapThread[{#1->#2}&,{list1,list2}]]

End[]; (* `Private` *)

EndPackage[];