AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];
Needs["statistics`"];

ClearAll[expectedValue];
expectedValue[probabilities_Association, n_] :=
 Module[{rates = Keys@probabilities, odds = Values@probabilities},
  Plus @@ (rates*odds*(PDF[PoissonDistribution[#], n] & /@ rates))/
  Plus @@ (odds*(PDF[PoissonDistribution[#], n] & /@ rates))]

Module[{types = 20, probabilities, typeProbabilities,
  allTypeTimelines, someTypeTimelines, restTypeTimelines,
  firstYears = Range[0, 42], meanData, meanPlotData, expectedData,
  nPolicyholders = 200, probPreData, probPreDataGrouped,
  probPreDataGroupedKeys, singlePlotData},

 BlockRandom[
  probabilities =
   Association@
    MapThread[#1 -> #2 &, {RandomSample[Range[1, 2*types], types],
      RandomReal[{0, 1}, types]}];
  probabilities = statistics`unitize[probabilities];
  typeProbabilities = Values@probabilities -> Keys@probabilities;,
  RandomSeeding -> 1];

 (*allTypeTimelines=Table[RandomVariate[PoissonDistribution[#],2]&/@\
RandomChoice[typeProbabilities,1000],nPolicyholders];*)


 (*ListPlot[Sort[probabilities],Frame\[Rule]True,FrameLabel\[Rule]{\
"Profile Type","Probability"},GridLines\[Rule]{Range@40,Range[0,0.2,0.\
005]},ImageSize\[Rule]788]//Print;*)
 (*expectedData={#,expectedValue[probabilities,#]}&/@firstYears;
 meanData=Table[Module[{list=Module[{select=Select[#,#[[1]]\[Equal]\
firstYears[[r]]&]},If[select==={},Null,Transpose[select][[2]]]]},If[\
list===Null,0,N@Mean[list]]],{r,1,Length@firstYears}]&/@\
allTypeTimelines;
 meanPlotData=MapThread[{#1,#2}&,{firstYears,#}]&/@meanData;
 ListLinePlot[{expectedData}~Join~meanPlotData,PlotStyle\[Rule]({{\
Thick,Darker@Green,Dashed}}~Join~Table[{Thickness[0],Gray,Opacity[0.1]\
},Length@meanPlotData]),ImageSize\[Rule]788,Mesh\[Rule]None,\
InterpolationOrder\[Rule]2,Frame\[Rule]True,FrameLabel\[Rule]{"# \
accidents in the First Year","Expected number of accidents in the \
second year"},AspectRatio\[Rule]43/50,PlotRange\[Rule]{{0,43},{0,50}}];
 Export[StringReplace[NotebookFileName[],".nb"\[Rule]".csv"],{{"Type \
of Profile","Probability of \
Profile"}}~Join~MapThread[{#1,#2}&,{Keys@probabilities,Values@\
probabilities}],OverwriteTarget\[Rule]True]*)

 probPreData =
  RandomVariate[PoissonDistribution[#], 2] & /@
   RandomChoice[typeProbabilities, 1000000];
 probPreDataGrouped = GroupBy[probPreData, #[[1]] &];
 probPreDataGroupedKeys = Keys[probPreDataGrouped];

 Module[{subData = probPreDataGrouped[#]},
    KeySort[N[
      Length /@ GroupBy[subData, #[[2]] &]/Length@subData]]] & /@
  probPreDataGroupedKeys
 ]