SetOptions[SelectedNotebook[], PrintingStyleEnvironment -> "Printout",
  ShowSyntaxStyles -> True]

Module[{marks = {Style["\[Checkmark]", Darker@Green],
  Style["✗", Red]}, replacer, configs, engines = 2},
  replacer[list_List] :=
      Table[If[list[[n]] == 1, marks[[1]], marks[[2]]], {n, 1,
        Length@list}];
  configs = (replacer /@
      Union@SortBy[
        Select[Tuples[{0, 1}, engines], Plus @@ # >= 0.5 engines &],
        Plus @@ # &]);
  TableForm[
    Table[Apply[StringJoin,
      ToString[#, StandardForm] & /@ configs[[n]]], {n, 1,
      Length@configs}]]]

Module[{marks = {Style["\[Checkmark]", Darker@Green],
  Style["✗", Red]}, replacer, configs, engines = 4},
  replacer[list_List] :=
      Table[If[list[[n]] == 1, marks[[1]], marks[[2]]], {n, 1,
        Length@list}];
  configs = (replacer /@
      Union@SortBy[
        Select[Tuples[{0, 1}, engines], Plus @@ # >= 0.5 engines &],
        Plus @@ # &]);
  TableForm[
    Table[Apply[StringJoin,
      ToString[#, StandardForm] & /@ configs[[n]]], {n, 1,
      Length@configs}]]]

Module[{marks = {Style["\[Checkmark]", Darker@Green],
  Style["✗", Red]}, replacer, configs, engines = 6},
  replacer[list_List] :=
      Table[If[list[[n]] == 1, marks[[1]], marks[[2]]], {n, 1,
        Length@list}];
  configs = (replacer /@
      Union@SortBy[
        Select[Tuples[{0, 1}, engines], Plus @@ # >= 0.5 engines &],
        Plus @@ # &]);
  TableForm[
    Partition[
      Table[Apply[StringJoin,
        ToString[#, StandardForm] & /@ configs[[n]]], {n, 1,
        Length@configs}], 7]]]

Module[{marks = {Style["\[Checkmark]", Darker@Green],
  Style["✗", Red]}, replacer, configs, engines = 8},
  replacer[list_List] :=
      Table[If[list[[n]] == 1, marks[[1]], marks[[2]]], {n, 1,
        Length@list}];
  configs = (replacer /@
      Union@SortBy[
        Select[Tuples[{0, 1}, engines], Plus @@ # >= 0.5 engines &],
        Plus @@ # &]);
  TableForm@
      Partition[
        Join @@ {Table[
          Apply[StringJoin,
            ToString[#, StandardForm] & /@ configs[[n]]], {n, 1,
            Length@configs}],
          Table[Style[StringJoin @@ Table["\[Checkmark]", engines], White],
            5]}, 8]]


Module[{n = 4}, Solve[\!\(
\ * UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(2\)]\(Binomial[2, i]
\ * SuperscriptBox[\(p\), \(i\)]
\ * SuperscriptBox[\((1 - p)\), \(2 - i\)]\)\) == \!\(
\ * UnderoverscriptBox[\(\[Sum]\), \(i = 0.5  n\), \(n\)]\(Binomial[n,
  i]
\ * SuperscriptBox[\(p\), \(i\)]
\ * SuperscriptBox[\((1 - p)\), \(n - i\)]\)\), p]]


Module[{maxE = 4}, Plot[Evaluate@Table[\!\(
\ * UnderoverscriptBox[\(\[Sum]\), \(i = 0.5  r\), \(r\)]\(Binomial[r,
  i]
\ * SuperscriptBox[\(p\), \(i\)]
\ * SuperscriptBox[\((1 - p)\), \(r - i\)]\)\), {r, 2, maxE, 2}], {p, 0,
  1}, ImageSize -> 575,
AxesLabel -> {"\!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\)", "\!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\) for 50% or more engines"},
PlotLegends ->
    Table["No. of Engines = " <> ToString[n], {n, 2, maxE, 2}]]]


Module[{maxE = 16}, Plot[Evaluate@Table[\!\(
\ * UnderoverscriptBox[\(\[Sum]\), \(i = 0.5  r\), \(r\)]\(Binomial[r,
  i]
\ * SuperscriptBox[\(p\), \(i\)]
\ * SuperscriptBox[\((1 - p)\), \(r - i\)]\)\), {r, 2, maxE, 2}], {p, 0,
  1}, ImageSize -> 575,
AxesLabel -> {"\!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\)", "\!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\) for 50% or more engines"},
PlotLegends ->
    Table["No. of Engines = " <> ToString[n], {n, 2, maxE, 2}]]]