(* :Title: qFunctions *)
(* :Context: qFunctions` *)
(* :Author: Alcatraz *)
(* :Date: 2018-07-14 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2018 Alcatraz *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["qFunctions`"];

SomeListQ::usage = "Yields True if any of the elements in the given list are of the form List";
AllListQ::usage = "Yields True if all of the elements in the given list are of the form List";

Begin["`Private`"];

SomeListQ[list_List] := Or @@ (ListQ /@ list);
AllListQ[list_List] := And @@ (ListQ /@ list);


End[]; (* `Private` *)

EndPackage[];