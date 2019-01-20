(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-20 *)
(* :OriginalCreationDate: 2017-01-14 *)

Graphics[Table[{Hue[RandomChoice[{0.0, 0.2}]], Opacity[0.35],
  Thickness[0],
  Line[{{RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}}]}, {n, 1, 2000}],
  Background -> White, PlotRange -> {{-15, 15}, {-15, 15}}]

GraphicsGrid[
  Table[Graphics[
    Table[{Hue[RandomReal[{y + z, y + z + 0.2}]], Opacity[0.25],
      Thickness[0],
      Line[{{RandomInteger[{-10, 10}],
        RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
        RandomInteger[{-10, 10}]}}]}, {n, 1, 5000}],
    Background -> White], {z, 0.0, 0.6, 0.3}, {y, 0.0, 0.2, 0.1}],
  ImageSize -> 1100]

Graphics[Table[{Hue[RandomChoice[{0.55, 0.65}]], Opacity[0.25],
  Thickness[0],
  Line[{{RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}}]}, {n, 1, 2000}],
  Background -> White]

Export["Random_art_06_02_2.png", %, ImageSize -> 2000]


(*Probably some part of the following chunk is a repetition*)
Graphics[Table[{Hue[RandomChoice[{0.0, 0.2}]], Opacity[0.25],
  Thickness[0],
  Line[{{RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}}]}, {n, 1, 10000}],
  Background -> White]

GraphicsGrid[
  Table[Graphics[
    Table[{Hue[RandomReal[{y + z, y + z + 0.2}]], Opacity[0.25],
      Thickness[0],
      Line[{{RandomInteger[{-10, 10}],
        RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
        RandomInteger[{-10, 10}]}}]}, {n, 1, 5000}],
    Background -> White], {z, 0.0, 0.6, 0.3}, {y, 0.0, 0.2, 0.1}],
  ImageSize -> 1100]

y = 0.6;
Graphics[Table[{Hue[RandomReal[{y, y + 0.2}]], Opacity[0.25],
  Thickness[0],
  Line[{{RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}, {RandomInteger[{-10, 10}],
    RandomInteger[{-10, 10}]}}]}, {n, 1, 10000}],
  Background -> White]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
sample = 1000; list = Table[RandomChoice[points], sample];
len = 200;
Manipulate[
  Graphics[BezierCurve[Table[list[[n]], {n, r, r + len, 1}],
    SplineDegree -> 5], PlotRange -> {{-10, 10}, {-10, 10}}], {r, 1,
  sample - len, 1}]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 4}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
Graphics[{Opacity[0.5], Thickness[0],
  BezierCurve[Table[RandomChoice[points], {n, 1, 2500, 1}],
    SplineDegree -> 5]}, PlotRange -> {{-4, 4}, {-4, 4}}]

sspl = 3;
spl = 1000;
points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
Graphics[Table[{Opacity[0.5], Hue[RandomReal[{0, 0.2}]], Thickness[0],
  BezierCurve[Table[RandomChoice[points], sspl],
    SplineDegree -> 5]}, spl], PlotRange -> {{-10, 10}, {-10, 10}}]

sspl = 5;
spl = 1000;
points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
Graphics[Table[{Opacity[0.5], Hue[RandomReal[{0.4, 0.6}]],
  Thickness[0],
  BezierCurve[Table[RandomChoice[points], sspl], SplineDegree -> 5]},
  spl], PlotRange -> {{-10, 10}, {-10, 10}}]

sspl = 5;
spl = 1000;
points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
im = Table[
  Graphics[
    Table[{Opacity[0.5], Hue[RandomReal[{y, y + 0.01}]], Thickness[0],
      BezierCurve[Table[RandomChoice[points], sspl],
        SplineDegree -> 5]}, spl],
    PlotRange -> {{-10, 10}, {-10, 10}}], {y, 0, 0.99, 0.01}];
Export["Spline.gif", im, ImageSize -> 700]

sspl = 3;
spl = 200;
points = Flatten[
  Table[{{m Sin[n] + RandomReal[{-1, 1}],
    m Cos[n] + RandomReal[{-1, 1}]}}, {m, 1, 10}, {n, 0,
    2 \[Pi], \[Pi] / (3 m)}], 2];
Graphics[Table[{Opacity[0.5], White, Thickness[0],
  BezierCurve[Table[RandomChoice[points], sspl], SplineDegree -> 3]},
  spl], PlotRange -> {{-10, 10}, {-10, 10}}, Background -> Black]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
GraphicsGrid[Table[sspl = 2; spl = 750;
Graphics[
  Table[{Opacity[0.5], Hue[RandomReal[{y + z, y + z + 0.2}]],
    Thickness[0],
    BezierCurve[Table[RandomChoice[points], sspl],
      SplineDegree -> 5]}, spl],
  PlotRange -> {{-10, 10}, {-10, 10}}], {z, 0.0, 0.6, 0.3}, {y, 0.0,
  0.2, 0.1}], ImageSize -> 1100]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
GraphicsGrid[Table[sspl = 3; spl = 750;
Graphics[
  Table[{Opacity[0.5], Hue[RandomReal[{y + z, y + z + 0.2}]],
    Thickness[0],
    BezierCurve[Table[RandomChoice[points], sspl],
      SplineDegree -> 5]}, spl],
  PlotRange -> {{-10, 10}, {-10, 10}}], {z, 0.0, 0.6, 0.3}, {y, 0.0,
  0.2, 0.1}], ImageSize -> 1100]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
GraphicsGrid[Table[sspl = 4; spl = 750;
Graphics[
  Table[{Opacity[0.5], Hue[RandomReal[{y + z, y + z + 0.2}]],
    Thickness[0],
    BezierCurve[Table[RandomChoice[points], sspl],
      SplineDegree -> 5]}, spl],
  PlotRange -> {{-10, 10}, {-10, 10}}], {z, 0.0, 0.6, 0.3}, {y, 0.0,
  0.2, 0.1}], ImageSize -> 1100]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
GraphicsGrid[Table[sspl = 10; spl = 100;
Graphics[
  Table[{Opacity[0.7], Hue[RandomReal[{y + z, y + z + 0.2}]],
    Thickness[0],
    BezierCurve[Table[RandomChoice[points], sspl],
      SplineDegree -> 5]}, spl], PlotRange -> {{-10, 10}, {-10, 10}},
  Background -> White], {z, 0.0, 0.6, 0.3}, {y, 0.0, 0.2, 0.1}],
  ImageSize -> 1100]

points = Flatten[
  Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi] / (
    3 m)}], 2];
Export["Ranart_6_circ_01_03.png",
  GraphicsGrid[Table[sspl = 10; spl = 400;
  Graphics[
    Table[{Opacity[0.7], Hue[RandomReal[{y + z, y + z + 0.2}]],
      Thickness[0],
      BezierCurve[Table[RandomChoice[points], sspl],
        SplineDegree -> 5]}, spl], PlotRange -> {{-10, 10}, {-10, 10}},
    Background -> White], {z, 0.0, 0.6, 0.3}, {y, 0.0, 0.2, 0.1}]],
  ImageSize -> 4000]

im = Graphics[
  Point[points =
      Flatten[Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0,
        2 \[Pi], \[Pi] / (3 m)}], 2]]];
Export["Ranart_6_circ_00.png", im, ImageSize -> 700]

points = Flatten[
   Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi]/(
     3 m)}], 2];
Table[Export[
  StringJoin["Ranart_set_1.1_", ToString[spl], "_lines.png"],
  Graphics[Table[{Opacity[0.5], Hue[RandomReal[{0, 0.2}]],
     Thickness[0],
     BezierCurve[Table[RandomChoice[points], 3], SplineDegree -> 5]},
    spl], PlotRange -> {{-10, 10}, {-10, 10}}],
  ImageSize -> 2000], {spl, 1000, 10000, 2000}]

points = Flatten[
   Table[{{m Sin[n], m Cos[n]}}, {m, 1, 10}, {n, 0, 2 \[Pi], \[Pi]/(
     3 m)}], 2];
Table[Export[
  StringJoin["Ranart_set_1.3_", ToString[spl], "_lines.png"],
  Graphics[Table[{Opacity[0.5], Hue[RandomReal[{0.5, 0.7}]],
     Thickness[0],
     BezierCurve[Table[RandomChoice[points], 3], SplineDegree -> 5]},
    spl], PlotRange -> {{-10, 10}, {-10, 10}}],
  ImageSize -> 2000], {spl, 1000, 10000, 2000}]

ext = 5; spl = 1000;
points = Flatten[Table[{n, m}, {n, -ext, ext, 1}, {m, -ext, ext, 1}],
   1];
Graphics[Table[{Hue[RandomReal[{0.6, 0.6}]], Opacity[0.5],
   Thickness[0],
   BezierCurve[
    Table[RandomChoice[points](*+(RandomReal[{-1,1}]/5)*), 3],
    SplineDegree -> 3]}, spl], Background -> White]

