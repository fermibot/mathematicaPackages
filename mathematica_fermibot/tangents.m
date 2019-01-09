Module[
  {number = 10000, tang, norm, opacity = Opacity[0.02], rx, ry},
  rx[t_] := (3 + 1.5 Sin[3 t]) Sin[t];
  ry[t_] := (3 + 1.5 Sin[3 t]) Cos[t];
  tang = D[{rx[t], ry[t]}, {t, 1}];
  norm = D[{rx[t], ry[t]}, {t, 2}];
  a = ParametricPlot[{rx, ry}, {t, 0, 2 \[Pi]}, Frame -> False,
    Axes -> False, PlotStyle -> {Hue[0.2], Specularity -> None},
    PlotPoints -> 21, Mesh -> None];
  b = Graphics[{Hue@0.5, opacity,
    Line[Flatten[
      Table[{{rx[t], ry[t]}, {rx[t], ry[t]} + tang}, {t,
        Divide[2 \[Pi], number], 2 \[Pi], Divide[2 \[Pi], number]}],
      0]]}];
  c = Graphics[{LightBlue, opacity,
    Line[Flatten[
      Table[{{rx[t], ry[t]}, {rx[t], ry[t]} + norm}, {t,
        Divide[2 \[Pi], number], 2 \[Pi], Divide[2 \[Pi], number]}],
      0]]}];(*Normal*)
  c = Show[a, b, PlotRange -> All, Background -> Black,
    ImageSize -> 788]
]