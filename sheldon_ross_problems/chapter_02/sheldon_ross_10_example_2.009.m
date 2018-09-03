SetOptions[SelectedNotebook[], PrintingStyleEnvironment -> "Printout",
  ShowSyntaxStyles -> True]

Module[{parent1 = Style["dr", 12, Red],
  parent2 = Style["rr", 12, Darker@Green]}, {parent1, parent2}]

Module[{parent1 = Style["d", 12, Red],
  parent2 = Style["r", 12, Darker@Green], children},
  children = Tuples[{parent1, parent2}, 2];
  Table[Apply[StringJoin,
    ToString[#, StandardForm] & /@ children[[r]]], {r, 1,
    Length@children}]]

ClearAll[childrenColor, progeny];

(*This function colors the string. This function has not been used \
here by the way*)
childrenColor[child_String] := Module[{list = StringSplit[child, ""]},
  Table[If[list[[r]] == "r", Style["r", Darker@Green],
    Style["d", 12, Red]], {r, 1, Length@list}]]

(*This function simulates the progeny given a number*)
progeny[number_] :=
    Module[{parent1 = "d", parent2 = "r", children, barData},
      children =
          StringJoin @@@ RandomChoice[{parent1, parent2}, {number, 2}];
      barData = Transpose[{Length[#], #[[1]]} & /@ Gather@children];
      BarChart[barData[[1]], ChartLabels -> barData[[2]],
        PlotLabel -> ToString[number] <> " children"]
    ]

GraphicsGrid[
  Partition[
    progeny[#] & /@ {25, 100, 200, 500, 1000, 5000, 10000, 20000,
      50000}, 3],
  ImageSize -> 700]

(*Modified function for this part*)
progeny[number_] :=
    Module[{parent1 = "d", parent2 = "r", children, barData},
      children =
          StringJoin @@@ RandomChoice[{parent1, parent2}, {number, 2}]]

exactly3Dominant[trials_] :=
    Module[{three =
        Length@Cases[
          Length[Cases[#, "dd" | "dr" | "rd"]] & /@
              Table[progeny[4], trials], 3]},
      three / trials]

Module[{trials = {10, 25, 50, 100, 200, 300, 500, 750, 1000, 2000,
  5000, 10000}},
  DistributionChart[Table[exactly3Dominant[#], 100] & /@ trials,
    ChartElementFunction -> "HistogramDensity", ImageSize -> 700,
    PlotLabel -> "Distribution of fixed trials repeated 100 times.",
    ChartLabels -> trials,
    AxesLabel -> {"Trials", "Probability"}]]

