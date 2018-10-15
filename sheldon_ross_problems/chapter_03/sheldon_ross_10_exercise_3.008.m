AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

Histogram[
  Parallelize[
    Mean[Differences[
      Position[RandomInteger[{1, 6}, 1000], 6] // Flatten]] & /@
        Range[10000]], {0.02}, "Probability", ImageSize -> 800,
  Frame -> True, PlotLabel -> "Mean[X]"]

Module[{data =
    Partition[
      ToExpression[#] & /@
          StringSplit[Import[FileNames["*.txt", NotebookDirectory[]][[1]]],
            "\n"], 100]},
  Histogram[Mean[#] & /@ data, {0.02}, ImageSize -> 800, Frame -> True,
    PlotLabel -> "Mean[X|Y=5]"]]