(*Random Art Part 01*)
Graphics[Table[{Opacity[0.5], Hue[n / 10],
  Rotate[Rectangle[{Sin[n], Sin[n]}, {Cos[n], Cos[n]}], (2 \[Pi] n) /
      100]}, {n, 1, 100}]]

t = 400;
Graphics[Table[{Opacity[5 / t],
  EdgeForm[{RandomChoice[{White, Green, Blue}], Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n], Sin[n]}, {Cos[n], Cos[n]}], (2 \[Pi] n) /
      t]}, {n, 1, t}]]

t = 5000;
Graphics[Table[{Opacity[5 / t], Yellow, EdgeForm[{Red, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n], Sin[n]}, {Cos[n], Cos[n]}], (2 \[Pi] n) /
      t]}, {n, 1, t}], ImageSize -> 750, Background -> LightBlue]

t = 1000;
Graphics[Table[{Opacity[5 / t], Yellow, EdgeForm[{Red, Opacity[0.05]}],
  Rotate[Rectangle[{Cos[n], Sin[n]}, {Sin[n], Cos[n]}], (2 \[Pi] n) /
      t]}, {n, 1, t}], ImageSize -> 750, Background -> LightBlue]

t = 500;
Manipulate[
  Graphics[Table[{Opacity[2 / t], Green, EdgeForm[{White, Opacity[0.3]}],
    Rotate[Rectangle[{Sin[n + r], Sin[n + r]}, {Cos[n + r],
      Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1, t}], Background -> Black,
    ImageSize -> 650], {r, 0, 2 \[Pi], \[Pi] / 500}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[2 / t], Green, EdgeForm[{White, Opacity[0.3]}],
    Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
      Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1,
    t}], Background -> Black, ImageSize -> 720], {r, 0,
  2 \[Pi], \[Pi] / 500}]

t = 500;
Manipulate[
  Graphics[Table[{Opacity[2 / t], Green, EdgeForm[{White, Opacity[0.1]}],
    Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
      Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1,
    t}], Background -> Black, ImageSize -> 650], {r, 0,
  2 \[Pi], \[Pi] / 500}]

t = 500; Table[
  Export[StringJoin["Random_Art_4_2_", ToString[ r / (\[Pi] / 400)],
    ".png"],
    Graphics[Table[{Opacity[8 / t], LightBlue,
      EdgeForm[{Blue, Opacity[0.1]}],
      Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
        Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n,
      1, t}], Background -> Black], ImageSize -> 1080],
  {r, \[Pi] / 400, 2 \[Pi], \[Pi] / 400}]

t = 500; Graphics[
  Table[{Opacity[10 / t], LightBlue, EdgeForm[{Blue, Opacity[0.2]}],
    Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], Background -> Black,
  ImageSize -> 1080]

t = 500; Table[
  Export[StringJoin["Random_Art_4_", ToString[ r / (\[Pi] / 400)], ".png"],
    Graphics[
      Table[{Opacity[2 / t], Green, EdgeForm[{White, Opacity[0.1]}],
        Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
          Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n,
        1, t}], Background -> Black], ImageSize -> 1080],
  {r, \[Pi] / 400, 2 \[Pi], \[Pi] / 400}]


(*Random Art Part 02*)
t = 5;
Graphics[Table[{Opacity[2 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 700, Background -> Black]

t = 10;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 20;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 50;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 100;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 200;
Graphics[Table[{Opacity[5 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 400;
Graphics[Table[{Opacity[10 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 700, Background -> Black]

t = 1000;
Graphics[Table[{Opacity[5 / t], Black,
  EdgeForm[{LightBlue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n], Sin[n] + Cos[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]

t = 400;
Graphics[Table[{Opacity[10 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> White]

t = 400;
Graphics[Table[{Opacity[10 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]


t = 400;
Graphics[Table[{Opacity[10 / t], LightBlue,
  EdgeForm[{Blue, Opacity[0.1]}],
  Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
    2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 650, Background -> Black]


t = 5; Graphics[
  Table[{Opacity[2 / t], LightBlue, EdgeForm[{Blue, Opacity[0.2]}],
    Rotate[Rectangle[{Sin[n] + Cos[n], Sin[n]}, {Cos[n], Cos[n]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], Background -> Black, ImageSize -> 700]



t = 500;
im = Table[
  Graphics[
    Table[{Opacity[2 / t], Green, EdgeForm[{White, Opacity[0.1]}],
      Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
        Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n,
      1, t}], Background -> Black], {r, \[Pi] / 400, \[Pi] / 8, \[Pi] /
      400}];
Export["RA4_Animation.gif", im, ImageSize -> 700]


t = 500;
im = Table[
  Graphics[
    Table[{Opacity[10 / t], LightBlue, EdgeForm[{Blue, Opacity[0.1]}],
      Rotate[Rectangle[{Sin[n + r] + Cos[n + r],
        Sin[n + r]}, {Cos[n + r], Cos[n + r]}], (2 \[Pi] n) / t]}, {n,
      1, t}], Background -> Black], {r, \[Pi] / 400, \[Pi] / 8, \[Pi] /
      400}];
Export["RA4_Animation_2.gif", im, ImageSize -> 700]


(*Random Art Part 03*)
t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[10 n + r],
      3 Cos[n + r] + Sin[ 10 n + r]}, {3 Sin[n + r],
      3 Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[7 n + r],
      3 Cos[n + r] + Sin[ 7 n + r]}, {3 Sin[n + r], 3 Cos[n + r]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[6 n + r],
      3 Cos[n + r] + Sin[6 n + r]}, {3 Sin[n + r], 3 Cos[n]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[5 n + r],
      3 Cos[n + r] + Sin[5 n + r]}, {3 Sin[n + r], 3 Cos[n + r]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[4 n + r],
      3 Cos[n + r] + Sin[ 4 n + r]}, {3 Sin[n + r], 3 Cos[n + r]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.02], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[100 n + r],
      3 Cos[n + r] + Sin[100 n + r]}, {5 Sin[n + r],
      5 Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

t = 200;
Manipulate[
  Graphics[Table[{Opacity[0.05], White,
    EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n + r] + Sin[4 n + r],
      3 Cos[n + r] + Cos[ 4 n + r]}, {3 Sin[n + r], 3 Cos[n + r]}], (
      2 \[Pi] n) / t]}, {n, 1, t}], ImageSize -> 500,
    Background -> Black, PlotRange -> {{-5, 5}, {-5, 5}}], {r, 0,
  2 \[Pi]}]

(*Image Export for 3 Lobes*)
t = 200;
lobe3 = Table[
  Graphics[
    Table[{Opacity[0.02], White, EdgeForm[{Green, Opacity[0.1]}],
      Rotate[Rectangle[{3 Sin[n + r] + Sin[4 n + r],
        3 Cos[n + r] + Sin[ 4 n + r]}, {3 Sin[n + r],
        3 Cos[n + r]}], (2 \[Pi] n) / t]}, {n, 1, t}],
    ImageSize -> 500, Background -> Black,
    PlotRange -> {{-5, 5}, {-5, 5}}], {r, (2 \[Pi]) / 3 / 50, (2 \[Pi]) /
      3, (2 \[Pi]) / 3 / 50}];
Export["Random_Art_5_3L_Anim.gif", lobe3, ImageSize -> 700,
  "DisplayDurations" -> 0.1]

lobe3s = Show[{ParametricPlot[{{3 Sin[n] + Sin[4 n],
  3 Cos[n] + Sin[ 4 n]}, {3 Sin[n], 3 Cos[n]}}, {n, 0, 2 \[Pi]},
  PlotStyle -> {{White, Opacity[0.5]}, {White, Opacity[0.5]}},
  Background -> Black, Axes -> False],
  Graphics[
    Table[{Opacity[0.02], White, EdgeForm[{Green, Opacity[0.1]}],
      Rotate[Rectangle[{3 Sin[n] + Sin[4 n],
        3 Cos[n] + Sin[ 4 n]}, {3 Sin[n], 3 Cos[n]}], (2 \[Pi] n) /
          t]}, {n, 1, t}], ImageSize -> 500, Background -> Black,
    PlotRange -> {{-5, 5}, {-5, 5}}]}];
Export["Random_Art_5_3L_Still_LRes.png", lobe3s, ImageSize -> 700]
Export["Random_Art_5_3L_Still_HRes.png", lobe3s, ImageSize -> 2000]


lobe3s = Show[{Graphics[
  Table[{Opacity[0.02], White, EdgeForm[{Green, Opacity[0.1]}],
    Rotate[Rectangle[{3 Sin[n] + Sin[4 n],
      3 Cos[n] + Sin[ 4 n]}, {3 Sin[n], 3 Cos[n]}], (2 \[Pi] n) /
        t]}, {n, 1, t}], ImageSize -> 500, Background -> Black,
  PlotRange -> {{-5, 5}, {-5, 5}}]}];
Export["Random_Art_5_3L_Still_LRes_NoRef.png", lobe3s,
  ImageSize -> 700]
Export["Random_Art_5_3L_Still_HRes_NoRef.png", lobe3s,
  ImageSize -> 2000]