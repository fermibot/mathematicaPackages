(* :OriginalCreationDate: 2017-02-04 *)

text = "Data Generation";
a = Graphics[Text[Style[text, 30, Brown, Opacity[0.7]]],
  Background -> Lighter[LightBlue], PlotRange -> {{-3, 3}, {-1, 1}}]
Export[StringJoin[text, ".png"], a, ImageSize -> 300]

text = "Data Visualization";
a = Graphics[Text[Style[text, 30, Brown, Opacity[0.7]]],
  Background -> LightGreen, PlotRange -> {{-3, 3}, {-1, 1}}]
Export[StringJoin[text, ".png"], a, ImageSize -> 300]

text = "Data Analysis";
a = Graphics[Text[Style[text, 30, Brown, Opacity[0.7]]],
  Background -> LightPurple, PlotRange -> {{-3, 3}, {-1, 1}}]
Export[StringJoin[text, ".png"], a, ImageSize -> 300]

text = "Data Generation";
a = Graphics[Text[Style[text, 30, Brown, Opacity[0.7]]],
  Background -> Lighter[LightBlue], PlotRange -> {{-3, 3}, {-1, 1}}]
Export[StringJoin[text, ".png"], a, ImageSize -> 300]

l = 100;
a = Table[{1 + RandomReal[{-.2, .2}], 2 + RandomReal[{-.2, .2}]}, {n,
  1, l}];
TableForm[a];
Dimensions[a]
MatrixQ[a]
GraphicsColumn[
  {Histogram[Table[1 - a[[n, 1]], {n, 1, l}], 50],
    Histogram[Table[2 - a[[n, 2]], {n, 1, l}], 50]
  }, ImageSize -> {400, 400}]

l = 10000;
a = Table[RandomReal[{-1, 1}], {n, 1, l}];
Histogram[Table[a[[n]], {n, 1, l}], 500]

l = 100;
a = Table[{1 + RandomReal[{-.2, .2}],
  100 + n + RandomReal[{-.2, .2}]}, {n, 1, l}];
\[ScriptCapitalH] = VarianceEquivalenceTest[a, "HypothesisTestData"]
\[ScriptCapitalH]["TestDataTable", All]