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

