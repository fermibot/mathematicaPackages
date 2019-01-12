(* ::Package:: *)

BeginPackage[ "evolution002`" ]
evolution002::usage = "To understand the variation of the species with the reproduction";

CreateIndividuals::"Use to create individuals";
CreateChildren::"Pass-in the list to create children from the individuals";
ShowIndividuals::"Display the people from the given list";
InBreed::"Inbreed the individuals for n generations";
InBreedList::"Inbreed the individuals for n generations and produce the history"

Begin["Private`"]
ClearAll[ToInteger,CreateIndividuals,iCreateIndividuals,CreateChildren,ShowIndividuals,InBreed,InBreedList];



ToInteger[obj_Real]:=Ceiling@Abs@obj;
Options[CreateIndividuals]={"Number"-> 20,"Organs"-> 12,"MaxValue"-> 1};
CreateIndividuals[number_Integer,organs_Integer,maxvalue_:1] :=iCreateIndividuals[number,organs,maxvalue];
CreateIndividuals[OptionsPattern[]]                          :=iCreateIndividuals[OptionValue["Number"],OptionValue["Organs"],OptionValue["MaxValue"]];

iCreateIndividuals[number_Integer,organs_Integer,maxvalue_]:=
	Module[{step=maxvalue/(number organs),bstep=maxvalue/number},
		Table[Table[m+n,{n,0,bstep-step,step}],{m,0,maxvalue-bstep,bstep}]];
iCreateIndividuals[number_Real,   organs_Real,   maxvalue_]:=
	Module[{iNumber=ToInteger[number],iOrgans=ToInteger[organs],step,bstep},step=maxvalue/(iNumber iOrgans);bstep=maxvalue/iNumber;
		Table[Table[m+n,{n,0,bstep-step,step}],{m,0,maxvalue-bstep,bstep}]];

CreateChildren[population_,num_Integer:1]:=Table[Module[{parents=RandomChoice[population,2]},Sort@Join[Flatten@Table[RandomChoice[parents[[n]],Length[parents[[2]]]/2],{n,1,2}]]],{num}];

ShowIndividuals[population_?ListQ,partition_:3]:=Table[Framed@Grid@Partition[Hue/@population[[n]],partition],{n,1,Length[population]}];

InBreed[firstgen_List,    gen_:10,child_:10]:=    Nest[CreateChildren[#,child]&,firstgen,gen];
InBreedList[firstgen_List,gen_:10,child_:10]:=NestList[CreateChildren[#,child]&,firstgen,gen];

End[]

EndPackage[]
