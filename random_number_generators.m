(* ::Package:: *)

BeginPackage["fermiRNGs`"]
Begin["Private`"]

ClearAll[LCG, u16807, eInv, BSM, lunchTruck]

LCG[m_,a_,c_,z_]:=Mod[(a*z)+c,m];

u16807[iseed_]:=Mod[(iseed)*16807,2147483647];

eInv=Compile[{{\[Lambda],_Real},{x ,_Real}},-\[Lambda] Log[x/2147483647]];

BSM[u_]:= Module[
{ a={2.50662823884, -18.61500062529,41.39119773534,-25.44106049637}, b={-8.47351093090, 23.08336743743,-21.06224101826,3.13082909833},
c={0.3374754822726147,0.9761690190917186,0.1607979714918209, 0.0276438810333863,0.0038405729373609,0.0003951896511919,0.0000321767881768,0.0000002888167364,0.0000003960315187}},
If[0.08<u< 0.92,
y=u-0.5;z=y^2;Return[y*((a[[1]]+\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 2\), \(4\)]\((a[\([i]\)]*
\*SuperscriptBox[\(z\), \(i - 1\)])\)\))/(1+\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(4\)]\((b[\([i]\)]*
\*SuperscriptBox[\(z\), \(i\)])\)\)))],
y=u-0.5;If[y<=0,z=u,z=1-u];\[Kappa]=Log[-Log[z]];Return[If[y>=0,1,-1]*\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(9\)]\((c[\([i]\)]*
\*SuperscriptBox[\(\[Kappa]\), \(i - 1\)])\)\)]]] ;

lunchTruck[iterruns_,seed1_,seed2_]:=
Module[
{list, arrtimes, leavetimes, waits, doc},
list=Table[
arrtimes=0;leavetimes=0;doc={};
While[
arrtimes<=300,(*Checking time units here*)
seed1=u16807[seed1];seed2=u16807[seed2];
(*Generating the leaving times here*)
leavetimes=Max[leavetimes,arrtimes]+eInv[0.8,seed1];
AppendTo[doc,{arrtimes,leavetimes-arrtimes}];
arrtimes=arrtimes+eInv[1,seed2]];
waits={};
Table[If[doc[[n,1]]>= 180,AppendTo[waits,doc[[n,2]]],None],{n,1,Length[doc],1}];
Max[waits],{iterruns}];
Return[list]]




End[]
EndPackage[]



