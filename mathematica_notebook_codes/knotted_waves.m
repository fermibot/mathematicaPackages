Manipulate[
  Graphics[{Hue[0.54], Opacity[0.6],
    Line[Table[{Sin[5 n - m / 2], Sin[n + m]}, {n, 1, 200}]]},
    Background -> White], {m, 0, 0.1 \[Pi]}]

Plot[Table[Sin[t] + c, {c, 0, 10}], {t, -2 \[Pi], 2 \[Pi]},
  Axes -> False]

Plot[Table[Sin[t + Abs[c / 2]] + c, {c, -10, 10, 0.2}], {t, -2 \[Pi],
  2 \[Pi]}, Axes -> False, ImageSize -> 700,
  PlotStyle -> {Thin, Opacity[0.9]}]

Plot[Table[
  Sin[t + c] + Sin[t + Abs[c]] + c, {c, -10, 10, 0.2}], {t, -2 \[Pi],
  2 \[Pi]}, Axes -> False, ImageSize -> 700,
  PlotStyle -> {Thin, Opacity[0.9]}]

Plot[Table[
  Sin[t] + c + Sin[t + Abs[c]] + c, {c, -10, 10, 0.2}], {t, -2 \[Pi],
  2 \[Pi]}, Axes -> False, ImageSize -> 600,
  PlotStyle -> {Thin, Opacity[0.9]}]

Plot[Table[Sin[t] + c, {c, -10, 10, 0.2}], {t, -2 \[Pi], 2 \[Pi]},
  Axes -> False, ImageSize -> 600, PlotStyle -> {Thin, Opacity[0.9]}]