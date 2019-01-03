(*The text files are output from the corresponding python file for the example  *)

ClearAll[plotBestPrizeSelections];


plotBestPrizeSelections[n_: 10, worstOrBest_: "" | "worst_"] :=
 Module[{plot, fileSuffix = StringDelete[worstOrBest, "_"],
   plotLabel =
    ToString[n] <> " gifts find " <>
     If[worstOrBest == "", "best", "worst"]},
  plot = Module[{
     fileNames =
      SortBy[
       FileNames[
        "*3.25_" <> worstOrBest <> ToString[n] <> "_*" ~~ "*txt",
        NotebookDirectory[]],
       ToExpression@
         Last[StringDelete[StringSplit[#, "_"], ".txt"]] &]},

    ListLinePlot[MapThread[#1 &,
      {Transpose[
        Parallelize[
         Module[{file =
              StringSplit[StringReplace[Import[#], "None" -> "0"],
               "\n"]},
            Count[file, #] & /@ ToString /@ Range[1, n]] & /@
          fileNames]],
       Range[1, n]}], PlotRange -> All, ImageSize -> 788,
     PlotLegends -> Range[n],
     PlotLabel -> Style[plotLabel, 15]]
    ];

  Print[plot];
  Export[StringReplace[NotebookFileName[],
    ".nb" -> "_" <> StringReplace[plotLabel, " " -> "_"] <> ".png"],
   plot, ImageSize -> 788, ImageResolution -> 500];
  ]

plotBestPrizeSelections[#, ""] & /@ {10, 50, 100}
plotBestPrizeSelections[#, "worst_"] & /@ {10, 50, 100}

