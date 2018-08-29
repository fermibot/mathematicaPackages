SetOptions[SelectedNotebook[], PrintingStyleEnvironment -> "Printout",
  ShowSyntaxStyles -> True]

plot[] :=
    Module[{poisson, sample = 500, movingProbability, scale = 0.001},
      poisson = RandomVariate[PoissonDistribution[1], sample];
      movingProbability =
          Transpose[{Reverse[Accumulate[poisson] / Range[sample]],
            scale * Range[sample]}];
      Graphics[{
        Table[{Opacity[0.1],
          Line[{{0, scale * r}, {poisson[[r]], scale r}}]}, {r, 1, sample}],
        {Red, Line[movingProbability]}},
        ImageSize -> 240, AspectRatio -> 1, Frame -> True,
        FrameTicks -> {Automatic, None}, PlotRange -> {{0, 6}, All}]]

plot[number_] := Parallelize[Table[plot[], number]]


Export[StringReplace[NotebookFileName[], ".nb" -> "_01.png"],
  GraphicsGrid[Partition[plot[30], 3]],
  ImageSize -> 754, ImageResolution -> 600]

