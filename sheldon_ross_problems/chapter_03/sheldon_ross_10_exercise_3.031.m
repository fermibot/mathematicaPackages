Module[{files =
    SortBy[FileNames["*.csv", NotebookDirectory[]],
      ToExpression[StringDelete[Last[StringSplit[#, "_"]], ".csv"]] &],
  labels},
  labels = StringDelete[Last[StringSplit[#, "_"]], ".csv"] & /@ files;
  Grid@Partition[
    MapThread[
      DistributionChart[
        Transpose[(Length /@ Gather[#]) & /@ Import[#1]],
        PlotLabel -> "\nProbability " <> #2,
        ImageSize -> 300] &, {files, labels}], 2]]