t = 200;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]^2}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black];

d = 20;
Graphics[
  {
    Table[{Point[{Sin[n] + Cos[n], Sin[n]}]}, {n, (2 \[Pi]) / d,
      2 \[Pi], (2 \[Pi]) / d}],
    Table[{Point[{Cos[n], Cos[n]^2}]}, {n, (2 \[Pi]) / d, 2 \[Pi], (
      2 \[Pi]) / d}]
  }
];

d = 250;
d = 300;
Manipulate[Graphics[
  {
    Table[{PointSize[0], Point[{Sin[n] + Cos[n], Sin[n]}]}, {n, (
      2 \[Pi]) / d, 2 \[Pi], (2 \[Pi]) / d}],
    Table[{PointSize[0], Point[(Sin[n] + {
      {Cos[n], Sin[n]}
    }).( {
      {Cos[\[Theta]], -Sin[\[Theta]]},
      {Sin[\[Theta]], Cos[\[Theta]]}
    } )]}, {n, (2 \[Pi]) / d, 2 \[Pi], (2 \[Pi]) / d}]
  }
  , ImageSize -> 500], {\[Theta], 0, \[Pi]}];

t = 200;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]^2}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black];

t = 200;
Graphics[Table[{Opacity[5 / t], Pink, EdgeForm[{White, Opacity[.2]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]^2}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black];

t = 200;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n], Cos[n]}, {Sin[n] + 2 Cos[n],
    Cos[n] + 2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650,
  Background -> Black];

t = 200;
Graphics[Table[{Opacity[5 / t], Red, EdgeForm[{White, Opacity[.2]}],
  Rotate[Rectangle[{Sin[n], Cos[n]}, {Sin[n] + 2 Cos[n],
    Cos[n] + 2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650,
  Background -> Black];

t = 250;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{White, Opacity[0.1]}],
  Rotate[Rectangle[{Cos[n + 0.2], -Cos[n + 0.2]^2}, {Cos[n],
    Cos[n]^2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 1000,
  Background -> Black];

t = 250;
Graphics[Table[{Opacity[5 / t], Hue[0.50],
  EdgeForm[{White, Opacity[.2]}],
  Rotate[Rectangle[{Cos[n + 0.2], -Cos[n + 0.2]^2}, {Cos[n],
    Cos[n]^2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 1000,
  Background -> Black];

t = 250;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{White, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n + 0.2]^2, Cos[n + 0.2]^2}, {Cos[n]^2,
    Cos[n]^2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
  Background -> Black];

t = 250;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{White, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n + 0.2]^2, Cos[n + 0.2]^2}, {Cos[n]^2,
    Cos[n]^2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
  Background -> Black];

t = 250;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Hue[0.8], Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n + 0.2]^2, Cos[n + 0.2]^2}, {Cos[n]^2,
    Cos[n]^2}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
  Background -> Black];

d = 50;
Graphics[
  {
    Table[{PointSize[0.005], Red, Point[{Sin[n]^2, Cos[n]^2}]}, {n, (
      2 \[Pi]) / d, 2 \[Pi], (2 \[Pi]) / d}],
    Table[{PointSize[0.005], Green, Point[{Cos[n]^2, Cos[n]^2}]}, {n, (
      2 \[Pi]) / d, 2 \[Pi], (2 \[Pi]) / d}]
  }
];

t = 500;
Graphics[Table[{Opacity[0.02], White, EdgeForm[{White, Opacity[0.1]}],
  Rotate[Rectangle[{3 Sin[n] + Sin[6 n],
    3 Cos[n] + Sin[6 n]}, {3 Sin[n], 3 Cos[n]}], (2 \[Pi] n) /
      t]}, {n, 1, t}], ImageSize -> 500, Background -> Black];

t = 500;
Graphics[Table[{Opacity[0.02], White, EdgeForm[{Green, Opacity[0.1]}],
  Rotate[Rectangle[{3 Sin[n] + Sin[6 n],
    3 Cos[n] + Sin[6 n]}, {3 Sin[n], 3 Cos[n]}], (2 \[Pi] n) /
      t]}, {n, 1, t}], ImageSize -> 500, Background -> Black];

Export["Rand_Art_Speci_01_01_LRes.png", "image", ImageSize -> 700];
Export["Rand_Art_Speci_01_01_HRes.png", "image", ImageSize -> 2000];

Graphics[{{LightBlue, Rectangle[{0, 0}, {3, 1}]},
  Text[Style["Random Art 5", Lighter[Hue[0.7]], 60], {1.5, 0.5}]},
  ImageSize -> 700];