(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

(*These are comments*)
ClearAll[NIntegerQ, Squarer]
NIntegerQ[num_] := ! IntegerQ[num];
Squarer[u_?IntegerQ] := u^2;
Squarer[u_?NIntegerQ] := Round[u]^2

GraphicsRow[{
  Plot[u^2, {u, -10, 10}],
  Plot[Squarer[u], {u, -10, 10}]}, ImageSize -> 600]


Plot[{u^2, Squarer[u]}, {u, -10, 10}, PlotLegends -> "Expressions",
  Exclusions -> None]

Plot[{WaveSquarer[x], Sin[x]}, {x, -2 \[Pi], 2 \[Pi]},
  Exclusions -> None, PlotLegends -> "Expressions", ImageSize -> 400]

Plot[{WaveClipper[x, 0.3], Sin[x]}, {x, -2 \[Pi], 2 \[Pi]},
  Exclusions -> None, PlotLegends -> "Expressions", ImageSize -> 400]

(*Start From here*)

banks = {{"Axis", 10}, {"SBI", 11}, {"Grameen", 2}, {"Cooperative UB",
  6}, {"HDFC", 9}, {"IDBI", 8}};
intBanks = {{2, "A Bank"}, {"Asian Dev Bank", 0.2}};
ClearAll[InterestCalc, ListCheckQ]
ListCheckQ[bank_?ListQ] :=
    If[Head[bank[[1]]] == String && NumberQ[bank[[2]]] &&
        Length[bank] == 2, True, False]
ListCheckQ2[bank_?ListQ] :=
    If[Head[bank[[2]]] == String && NumberQ[bank[[1]]] &&
        Length[bank] == 2, True, False]

InterestCalc[appu_, pannu_ : 8] := appu * (0.01 pannu);
InterestCalc[amount_, byanku_?ListCheckQ] := amount * 0.01 byanku[[2]];
InterestCalc[amount_, byanku_?ListCheckQ2] := amount * 0.01 byanku[[1]];
InterestCalc[30000, intBanks[[1]]]

ClearAll[Squarer, NIntegerQ];
NIntegerQ[obj_] := ! IntegerQ[obj]
Squarer[x_?IntegerQ] := x^2;
Squarer[x_?NIntegerQ] := Round[x]^2;
FloorSquarer[x_?Integer] := x^2;
FloorSquarer[x_?NIntegerQ] := Floor[x]^2
CeilingSquarer[x_?Integer] := x^2;
CeilingSquarer[x_?NIntegerQ] := Ceiling[x]^2

Squarer[2]

Plot[{x^2, Squarer[x], FloorSquarer[x], CeilingSquarer[x]}, {x, -10, 10},
  PlotLegends -> "Expressions",
  Exclusions -> None,
  Filling -> Axis,
  FillingStyle -> Lighter@LightBlue]

MyFunction[x__] := x;
MyFunction[1, 2, 3]