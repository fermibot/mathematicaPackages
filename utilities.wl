(* ::Package:: *)

BeginPackage["utilities`"];


accumulatingMean::usage="Calculates the accumulating range of a list"; 
stringJoinStyled::usage="Joins a list of styled string objects"; 
stringJoinBuffer::usage="Joins a list of strings with a buffer in between them for spacing";


Begin["Private`"];

accumulatingMean[list_List]:=N[Accumulate[list]/Range[1,Length[list]]]

stringJoinStyled[items_List,buffer_:""]:=Apply[StringJoin, ToString[#, StandardForm] & /@ Riffle[items,buffer]]
stringJoinBuffer[items_List,buffer_:""]:=StringJoin@@Riffle[ToString/@items,buffer]

End[];

EndPackage[];
