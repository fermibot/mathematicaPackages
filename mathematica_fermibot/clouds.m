(*Clouds*)

Graphics3D[{GrayLevel[RandomReal[{0.2, 0.7}]],
  PointSize[RandomReal[{0.0005, 0.0008}]],
  Table[Point[
    Accumulate[
      Table[{RandomReal[{-1.1, 1.1}], RandomReal[{-1.1, 1}],
        RandomReal[{-1.1, 1.1}]}, {n, 0, 1000}]]], {m, 1, 400}]}]

Graphics[{GrayLevel[RandomReal[{0.2, 0.7}]], Opacity[RandomReal[]],
  PointSize[RandomReal[{0.001, 0.002}]],
  Table[Point[
    Accumulate[
      Table[{RandomReal[{-1.1, 1.1}], RandomReal[{-1.1, 1}]}, {n, 0,
        1000}]]], {m, 1, 150}]} ]

Graphics[Table[{PointSize[RandomReal[{0.001, 0.002}]],
  Point[Accumulate[
    Table[{RandomReal[{-1.1, 1.1}], RandomReal[{-1.1, 1}]}, {n, 0,
      1000}]]]}, {m, 1, 110}]]

a = Graphics[
  Table[{PointSize[RandomReal[{0.0005, 0.0008}]],
    GrayLevel[RandomReal[{0.2, 0.4}]],
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        5000}]]]}, {m, 0, 100}]]
Export["RandomWalk4.png", a, ImageSize -> 4000];

Graphics3D[
  Table[{PointSize[RandomReal[{0.0005, 0.0008}]],
    GrayLevel[RandomReal[{0.2, 0.4}]],
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}],
        RandomReal[{-1, 1}]}, {n, 0, 5000}]]]}, {m, 0, 100}]]

Graphics3D[
  Table[{PointSize[RandomReal[{0.0005, 0.0008}]],
    GrayLevel[RandomReal[{0.2, 0.4}]],
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}],
        RandomReal[{-1, 1}]}, {n, 0, 5000}]]]}, {m, 0, 100}]]

a = Graphics[
  Table[{PointSize[RandomReal[{0.00005, 0.00008}]],
    GrayLevel[RandomReal[{0.2, 0.4}]],
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        10000}]]]}, {m, 0, 100}]];
b = Graphics[
  Table[{PointSize[RandomReal[{0.00005, 0.00008}]],
    GrayLevel[RandomReal[{0.2, 0.4}]],
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        10000}]]]}, {m, 0, 100}]];
c = Show[a, b]
Export["RandomWalk4.png", c, ImageResolution -> 1000];


(*Clouds program only*)
a2 = Graphics[{{GrayLevel[0.8], Disk[{0, 0}, 4]},
  Table[{GrayLevel[RandomReal[]], Opacity[RandomReal[{0.2, 0.5}]],
    PointSize -> 0.00002,
    Table[Point[
      Accumulate[
        Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
          10000}]]], {m, 0, 5}]}, {o, 0, 20}]}, Background -> Black]
Export["Moon Cloud (1).png", a2, ImageResolution -> 1000];


(*Clouds with moon and stars*)
a3 = Graphics[{{GrayLevel[0.8], Disk[{0, 0}, 40]},
  Table[{GrayLevel[RandomReal[]], Opacity[RandomReal[{0.2, .5}]],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        30000}]]]}, {m, 0, 150}]}, Background -> Black];
Export["Moon Cloud (18).png", a3, ImageResolution -> 1000];



(*Best program among the ones in this page. This comment was made when the original code was written in 2013*)
a = Graphics[
  Table[{Hue[RandomReal[{0.558, 0.8}]],
    PointSize[RandomReal[{0.002, .003}]],
    Point[{RandomReal[{-250, 250}], RandomReal[{-250, 250}]}]}, {n, 0,
    100}], Background -> Black]
Export["Starry Night.png", a, ImageResolution -> 1000]

a3 = Graphics[{{GrayLevel[0.8], Disk[{0, 0}, 30]},
  Table[{GrayLevel[RandomReal[]], Opacity[RandomReal[{0.2, .5}]],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        30000}]]]}, {m, 0, 150}]}];
a = Graphics[
  Table[{Hue[RandomReal[{0.558, 0.8}]],
    PointSize[RandomReal[{0.001, .002}]],
    Point[{RandomReal[{-250, 250}], RandomReal[{-250, 250}]}]}, {n,
    0, 100}]];
a4 = Show[a, a3, Background -> Black];
Export["Starry Night (6).png", a4, ImageResolution -> 1000];


(*Clouds 3*)
ParametricPlot[{Sin[t], -0.5 Cos[t - Sin[t]]}, {t, 0, 2 \[Pi]}]

ParametricPlot[{(15 Sin[t] + 2 Cos[30 t] +
    0.5 Cos[300 t]), (-7.5 Cos[t - Sin[t]] + 2 Sin[30 t] +
    0.5 Sin[300 t])}, {t, 0, 2 \[Pi]}, MaxRecursion -> 10]

ParametricPlot[{(15 Sin[t] + 2 Cos[30 t] + 0.5 Cos[300 t]) E^(
  0.025 t), (-7.5 Cos[t - Sin[t]] + 2 Sin[30 t] + 0.5 Sin[300 t]) E^(
  0.025 t)}, {t, 0, 20 \[Pi]}, MaxRecursion -> 10]

a = Graphics[
  Table[{PointSize[RandomReal[{0.0002, 0.0003}]],
    GrayLevel[RandomReal[{0.5, 0.6}]],
    Point[{(15 Sin[t] + 2 Cos[30 t] +
        0.5 Cos[300 t]) E^(-0.025 t), (-7.5 Cos[t - Sin[t]] +
        2 Sin[30 t] + 0.5 Sin[300 t]) E^(-0.025 t)}]}, {t, 0,
    20 \[Pi], 0.0025 \[Pi]}], Background -> Black]
Export["Clouds.png", a, ImageResolution -> 1000]

a1 = Graphics[
  Table[{GrayLevel[RandomReal[]], PointSize -> 0.00002,
    Table[Point[
      Accumulate[
        Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
          10000}]]], {m, 0, 5}]}, {o, 0, 20}], Background -> Black]
Export["cloud (2).png", a1, ImageResolution -> 1000];

Graphics[Disk[{0, 0}, 10]]


(*Moon Clouds*)
a2 = Graphics[{
  {GrayLevel@0.8, Disk[{0, 0}, 4]},
  Table[{GrayLevel[RandomReal[]], Opacity[RandomReal[{0.2, 0.5}]],
    PointSize -> 0.00002,
    Table[Point[
      Accumulate[
        Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
          10000}]]], {m, 0, 5}]}, {o, 0, 20}]}, Background -> Black]

a4 = Table[Graphics[{
  {GrayLevel@0.8, Disk[{r, 0}, 4]},
  Table[{GrayLevel@RandomReal[], Opacity@RandomReal[{0.2, 0.5}],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        5000}]]]}, {m, 0, 100}]}, Background -> Black,
  PlotRange -> {{-100, 100}, {-100, 100}}], {r, 10, 100}]

Graphics[{
  {GrayLevel@0.8, Disk[{0, 0}, 4]},
  Table[{GrayLevel@RandomReal[], Opacity@RandomReal[{0.2, 0.5}],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        10000}]]]}, {m, 0, 10}]},
  Background -> Black, PlotRange -> {{-100, 100}, {-100, 100}}]


(*Moon Clouds (1)*)
a2 = Graphics[
  {
    {GrayLevel@0.8, Disk[{0, 0}, 4]},
    Table[{GrayLevel@RandomReal[], Opacity@RandomReal[{0.2, 0.5}],
      PointSize -> 0.00002,
      Table[Point[
        Accumulate[
          Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
            10000}]]], {m, 0, 5}]}, {o, 0, 20}]}, Background -> Black]

a4 = Table[Graphics[{{GrayLevel@0.8, Disk[{r, 4}, 4]},
  Table[{GrayLevel@RandomReal[], Opacity@RandomReal[{0.2, 0.5}],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        5000}]]]}, {m, 0, 100}]}, Background -> Black, ], {r, 10,
  100}]

Graphics[{{GrayLevel@0.8, Disk[{0, 0}, 4]},
  Table[{GrayLevel@RandomReal[], Opacity@RandomReal[{0.2, 0.5}],
    PointSize -> 0.00002,
    Point[Accumulate[
      Table[{RandomReal[{-1, 1}], RandomReal[{-1, 1}]}, {n, 0,
        10000}]]]}, {m, 0, 10}]}, Background -> Black,
  PlotRange -> {{-100, 100}, {-100, 100}}]