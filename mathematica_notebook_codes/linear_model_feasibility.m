Manipulate[
  {
    RegionPlot[{(((a11 * x1) + ( a12 x2)) <=
        b1) && (((a21 * x1) + (a22 * x2)) <= b2)}, {x1, 0, 10}, {x2, 0,
      10}, PlotRange -> {{-10, 10}, {-10, 10}}, ImageSize -> 500,
      Axes -> True, AxesStyle -> {Lighter[Blue], Lighter[Blue]},
      AxesLabel -> {"x1", "x2"},
      PlotLabel ->
          StringJoin["Primal Space: Objective = ",
            ToString[(c1 x1 + c2 x2)]]],
    RegionPlot[{(((a11 * y1) + (a21 * y2)) >=
        c1) && (((a12 * y1) + (a22 * y2))) >= c2}, {y1, 0, 20}, {y2, 0,
      20}, PlotRange -> {{-10, 10}, {-10, 10}}, ImageSize -> 500,
      Axes -> True, AxesStyle -> {Lighter[Blue], Lighter[Blue]},
      AxesLabel -> {"y1", "y2"},
      PlotStyle -> Lighter[Lighter[Lighter[Green]]],
      PlotLabel ->
          StringJoin[{"Dual Space: Objective = Min[",
            ToString[(b1 "y1" + b2 "y2")], "]"}]]},
  {a11, -2, 2, 0.1},
  {a12, -2, 2, 0.1},
  {a21, -2, 2, 0.1},
  {a22, -2, 2, 0.1},
  {b1, 0, 2, 0.1},
  {b2, 0, 2, 0.1},
  {c1, 0, 2, 0.2},
  {c2, 0, 2, 0.2}]