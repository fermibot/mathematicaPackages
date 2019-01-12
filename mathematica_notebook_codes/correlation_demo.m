(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)


(*NORTA method for generating correlated uniform random variables*)
normtouni[data_] :=
    Module[{xdat, ydat, unix, uniy},
      xdat = Table[data[[n, 1]], {n, 1, Length[data]}];
      ydat = Table[data[[n, 2]], {n, 1, Length[data]}];
      unix = Table[
        CDF[NormalDistribution[], xdat[[num]]], {num, 1, Length[xdat]}];
      uniy = Table[
        CDF[NormalDistribution[], ydat[[num]]], {num, 1, Length[ydat]}];
      {unix, uniy}]
data = Table[\[Rho] = RandomReal[{-1, 1}];
RandomVariate[
  MultinormalDistribution[{0,
    0}, {{1, r = 6 / \[Pi] ArcSin[\[Rho] / 2]}, {r, 1}}], {100}], {512}];
corruni = Table[normtouni[data[[n]]], {n, 1, Length[data]}];
TableForm[
  Partition[
    Table[Style[
      ToString[cr = SpearmanRho[corruni[[n, 1]], corruni[[n, 2]]]],
      Hue[.4 (1 - Abs[cr])]], {n, 1, Length[corruni]}], 16]]


(*NORTA method for generating correlated uniform random variables 1000 points*)
normtouni[data_] := Module[{xdat, ydat, unix, uniy},
  xdat = Table[data[[n, 1]], {n, 1, Length[data]}];
  ydat = Table[data[[n, 2]], {n, 1, Length[data]}];
  unix = Table[
    CDF[NormalDistribution[], xdat[[num]]], {num, 1, Length[xdat]}];
  uniy = Table[
    CDF[NormalDistribution[], ydat[[num]]], {num, 1, Length[ydat]}];
  {unix, uniy}]
data = Table[\[Rho] = RandomReal[{-1, 1}];
RandomVariate[
  MultinormalDistribution[{0,
    0}, {{1, r = 6 / \[Pi] ArcSin[\[Rho] / 2]}, {r,
    1}}], {1000}], {512}];
corruni = Table[normtouni[data[[n]]], {n, 1, Length[data]}];
TableForm[
  Partition[
    Table[Style[
      ToString[cr = SpearmanRho[corruni[[n, 1]], corruni[[n, 2]]]],
      Hue[.4 (1 - Abs[cr])]], {n, 1, Length[corruni]}], 16]]


aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    Table[RandomChoice[{RandomReal[], vars[[coh, t]], vars[[coh, t]],
      vars[[coh, t]]}], {t, 1, 1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = SpearmanRho[vars[[n]], vars[[m]]]],
        If[cr == 1, GrayLevel[0.85], Hue[.3 (1 - Abs[cr])]]], {n, 1,
    Length[vars]}, {m, 1, Length[vars]}],
  TableHeadings -> {varns, varns}]


(*Automated setting of the number of copies available for sampling*)
aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    Table[RandomChoice[
      Join[{RandomReal[]},
        Table[vars[[coh, t]], {RandomInteger[{1, 10}]}]]], {t, 1,
      1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = Correlation[vars[[n]], vars[[m]]]],
        Hue[.3 (1 - Abs[cr])]], {n, 1, Length[vars]}, {m, 1,
    Length[vars]}], TableHeadings -> {varns, varns}]


SeedRandom[1];
aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    RandomChoice[{-1, 1}] Table[
      RandomChoice[
        Join[{RandomReal[]},
          Table[vars[[coh, t]], {RandomInteger[{1, 40}]}]]], {t, 1,
        1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = Correlation[vars[[n]], vars[[m]]]],
        If[cr == 1 || n < m, GrayLevel[0.85], Hue[.5 - .5 Abs[cr]]]], {n,
    1, Length[vars]}, {m, 1, Length[vars]}],
  TableHeadings -> {varns, varns}]


SeedRandom[1];
aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    RandomChoice[{-1, 1}] Table[
      RandomChoice[
        Join[{RandomReal[]},
          Table[vars[[coh, t]], {RandomInteger[{1, 40}]}]]], {t, 1,
        1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = SpearmanRho[vars[[n]], vars[[m]]]],
        If[cr == 1 || n < m, GrayLevel[0.85], Hue[.2 + .5 Abs[cr]]]], {n,
    1, Length[vars]}, {m, 1, Length[vars]}],
  TableHeadings -> {varns, varns}]


aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    RandomChoice[{-1, 1}] Table[
      RandomChoice[
        Join[{RandomReal[]},
          Table[vars[[coh, t]], {RandomInteger[{1, 20}]}]]], {t, 1,
        1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = Correlation[vars[[n]], vars[[m]]]],
        If[cr == 1 || n < m, GrayLevel[0.85], Hue[.5 - .5 Abs[cr]]]], {n,
    1, Length[vars]}, {m, 1, Length[vars]}],
  TableHeadings -> {varns, varns}]


aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {8}]], {16}]];
vars[[1]] = Table[RandomReal[], {1000}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    RandomChoice[{-1, 1}] Table[
      RandomChoice[
        Join[{RandomReal[]},
          Table[vars[[coh, t]], {RandomInteger[{1, 20}]}]]], {t, 1,
        1000}], {n, 2, Length[vars]}];
TableForm[
  Table[\[Rho] =
      Style[ToString[cr = SpearmanRho[vars[[n]], vars[[m]]]],
        If[cr == 1 || n < m, GrayLevel[0.85], Hue[.2 + .5 Abs[cr]]]], {n,
    1, Length[vars]}, {m, 1, Length[vars]}],
  TableHeadings -> {varns, varns}]


SeedRandom[1];
aph = "abcedefghijklmnopqrstuvwxyz"; aph = Characters[aph];
varns = vars =
    Union[Table[StringJoin[Table[RandomChoice[aph], {3}]], {12}]];
vars[[1]] = Table[RandomReal[], {10}];
Table[coh = RandomInteger[{1, n - 1}];
vars[[n]] =
    RandomChoice[{-1, 1}] Table[
      RandomChoice[
        Join[{RandomReal[]},
          Table[vars[[coh, t]], {RandomInteger[{1, 5}]}]]], {t, 1,
        10}], {n, 2, Length[vars]}];
WordCloud[
  r = Flatten[
    Union[Table[{Tooltip[StringJoin[varns[[n]], ":", varns[[m]]],
      t = Abs@SpearmanRho[vars[[n]], vars[[m]]]],
      If[Abs[t] == 1, 0, t]}, {n, 1, Length[vars]}, {m, 1,
      Length[vars]}]], 1], Disk[{0, 0}, {6, 3}], ImageSize -> 1200]