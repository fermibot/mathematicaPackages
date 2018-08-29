AppendTo[$Path, "D:\\Mathematica Files 4K\\Packages"];
Needs["utilities`"];

ClearAll[rect, geometric];

rect[number_, yLocation_, height_] :=
    Piecewise[{
      {{Green, EdgeForm@Gray, Opacity@0.2,
        Rectangle[{0, yLocation}, {1, yLocation + height}]}, number == 1},
      {Table[{Red, EdgeForm@Gray, Opacity@0.2,
        Rectangle[{r, yLocation}, {r + 1, yLocation + height}]}, {r, 0,
        number - 2}]
          ~ Join ~ {Green, EdgeForm@Gray, Opacity@0.2,
        Rectangle[{number - 1, yLocation}, {number,
          yLocation + height}]}, number > 1}}]


geometric[p_, no_] :=
    Module[{data =
        Differences[
          Union @@ Position[RandomChoice[{p, 1 - p} -> {0, 1}, no], 1]],
      means},
      means = utilities`accumulatingMean[data];
      Graphics[
        {
          Table[rect[data[[n]], -n, 1], {n, 1, Length@data}],
          Line[Table[{means[[n]], -n}, {n, 1, Length@means}]]
        }
        , ImageSize -> 756, AspectRatio -> Length@data / Max@data
      ]
    ]


Export[StringReplace[NotebookFileName[], ".nb" -> "_03.png"],
  geometric[0.95, 2000]]