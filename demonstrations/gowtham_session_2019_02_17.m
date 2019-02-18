(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: gowtham_session_2019_02_17 *)
(* :Context: gowtham_session_2019_02_17` *)
(* :Author: Alcatraz *)
(* :Date: 2019-02-17 *)


f[p_, \[Lambda]_, r_] :=
 p (1 - p)^2 Divide[\[Lambda] (\[Lambda] (1 - p) +
       r) + \[Lambda]^2 (1 - p), (r + \[Lambda] (1 - p))^2]
Module[{plot},
 plot = With[{r = 0.4, \[Lambda]Range = Range[3, 6, 0.5]},
   Plot[Evaluate[
     Table[f[p, \[Lambda], r], {\[Lambda], \[Lambda]Range}]], {p, 0,
     1.2},
    ImageSize -> 1600,
    Frame -> True,
    GridLines -> {Range[0, 1.2, 0.02], Range[-0.5, 0.5, 0.05]},
    PlotRange -> Automatic,
    PlotLabel ->
     "\[ScriptCapitalV](\[ScriptP]) = \
\[ScriptP](1-\[ScriptP]\!\(\*SuperscriptBox[\()\), \
\(2\)]\)(\!\(\*FractionBox[\(\[Lambda] \((\[Lambda] \((1 - \
\[ScriptP])\) + r)\) + \*SuperscriptBox[\(\[Lambda]\), \(2\)] \((1 - \
\[ScriptP])\)\), SuperscriptBox[\((r + \[Lambda] \((1 - \
\[ScriptP])\))\), \(2\)]]\)); with r = 0.4",
    AspectRatio -> 0.4,
    FrameLabel -> (Style[#, 16, Black, Bold] & /@ {"\[ScriptP]",
        "\[ScriptCapitalV](\[ScriptP])"}),
    PlotLegends ->
     Placed[("\[Lambda] = " <> ToString[#]) & /@ \[Lambda]Range,
      Bottom]
    ]
   ];
 Export["HW2_Q1_wide_range.pdf", plot]
 ]