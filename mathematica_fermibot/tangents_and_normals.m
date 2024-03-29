ClearAll[tangentPlot]

Options[tangentPlot] = {"TangentColor" -> Hue@0.5,
  "TangentOpacity" -> 0.04, "NumberOfLines" -> 10000,
  ImageSize -> 788, Background -> Black, "ShowNormalsOnly" -> False,
  "NormalColor" -> Hue[0.5], "NormalOpacity" -> 0.04,
  "NormalFactor" -> 0.5, "TangentFactor" -> 0.5};

tangentPlot[rxIn_, ryIn_, OptionsPattern[]] := Module[
  {number = OptionValue["NumberOfLines"], tang, norm, rx, ry,
    tangentGraphics, normalGraphics, curvePlot},
  rx[t_] = rxIn;
  ry[t_] = ryIn;
  tang = D[{rx[t], ry[t]}, {t, 1}];
  norm = D[{rx[t], ry[t]}, {t, 2}];
  curvePlot =
      ParametricPlot[{rx, ry}, {t, 0, 2 \[Pi]}, Frame -> False,
        Axes -> False, PlotStyle -> {Hue[0.2], Specularity -> None},
        PlotPoints -> 21, Mesh -> None];
  tangentGraphics =
      Graphics[{OptionValue["TangentColor"],
        Opacity[OptionValue["TangentOpacity"]],
        Line[Flatten[
          Table[{{rx[t], ry[t]}, {rx[t], ry[t]} +
              OptionValue["TangentFactor"] tang}, {t,
            Divide[2 \[Pi], number], 2 \[Pi], Divide[2 \[Pi], number]}],
          0]]}];
  normalGraphics =
      Graphics[{OptionValue["NormalColor"],
        Opacity[OptionValue["NormalOpacity"]],
        Line[Flatten[
          Table[{{rx[t], ry[t]}, {rx[t], ry[t]} +
              OptionValue["NormalFactor"] norm}, {t,
            Divide[2 \[Pi], number], 2 \[Pi], Divide[2 \[Pi], number]}],
          0]]}];(*Normal*)

  Show[curvePlot,
    If[OptionValue["ShowNormalsOnly"], normalGraphics,
      tangentGraphics], PlotRange -> All,
    Background -> OptionValue[Background],
    ImageSize -> OptionValue[ImageSize]]
]


tangentPlot[(3 + 1.5 Sin[3 t]) Sin[t], (3 + 1.5 Sin[3 t]) Cos[t],
  "NumberOfLines" -> 10000]

tangentPlot[(3 + Sin[4 t]) Sin[t], (3 + Sin[4 t]) Cos[t],
  "NumberOfLines" -> 5000]

tangentPlot[(3 + Sin[5 t]) Sin[t], (3 + Sin[5 t]) Cos[t],
  "NumberOfLines" -> 10000, "TangentColor" -> Red]

tangentPlot[(3 + Sin[6 t]) Sin[t], (3 + Sin[6 t]) Cos[t],
  "NumberOfLines" -> 10000, "TangentColor" -> Hue[0.55]]

tangentPlot[Sin[t], Sin[t] Cos[t], Background -> White,
  "NumberOfLines" -> 10000, "TangentColor" -> Red]

tangentPlot[Sin[2 t], Sin[t] Cos[2 t], Background -> White,
  "NumberOfLines" -> 10000, "TangentColor" -> Gray]

tangentPlot[Sin[t] Cos[2 t], Sin[2 t] Cos[2 t]]

ParametricPlot[{Sin[3 t] Cos[3 t], Sin[2 t] Cos[3 t]}, {t, 0,
  2 \[Pi]}]


(*Normals file code has been modified and added here*)
tangentPlot[Cos[2 t] Power[E, -0.1 t], Sin[2 t] Power[E, -0.1 t],
  "NumberOfLines" -> 5000, "ShowNormalsOnly" -> True,
  "NormalColor" -> Green]

tangentPlot[Cos[2 t + t] Power[E, -0.1 t],
  Sin[2 t + t] Power[E, -0.1 t]]

tangentPlot[(3 + Sin[3 t]) Sin[t], (3 + Sin[3 t]) Cos[t],
  "ShowNormalsOnly" -> True, "NumberOfLines" -> 5000]

tangentPlot[(5 + Sin[5 t]) Sin[t], (5 + Sin[5 t]) Cos[t],
  "ShowNormalsOnly" -> True, "NumberOfLines" -> 5000,
  "NormalColor" -> Hue[0.55], "NormalOpacity" -> 0.2,
  "NormalFactor" -> 0.2]

