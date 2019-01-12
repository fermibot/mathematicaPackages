(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)


LastTaker[num_, digits_] :=
    ToExpression[
      StringJoin[
        StringPart[
          StringPadLeft[ToString[num], digits, "0"], -digits ;; -1]]];
LastTakerReal[num_, digits_] :=
    ToExpression[
      StringJoin[
        StringPart[
          StringPadLeft[ToString[Round[num]], digits,
            "0"], -digits ;; -1]]];

GraphicsRow[{
  ListPlot[Table[{n, LastTakerReal[11^n + 9^n, 4]}, {n, 1, 1000, 1}],
    ImageSize -> 600, AspectRatio -> 1, PlotStyle -> PointSize[0.003]],
  ListPlot[Table[{n, LastTakerReal[11^n + 5^n, 4]}, {n, 1, 5000, 10}],
    ImageSize -> 600, AspectRatio -> 1,
    PlotStyle -> PointSize[0.003]]}]