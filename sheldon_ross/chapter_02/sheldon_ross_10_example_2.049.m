AppendTo[$Path, "D:\\Mathematica Files 4K\\Packages"];
Needs["utilities`"]

Module[{markovString, probabilities},

  markovString[list_List] :=
      styledStringJoin[{Style[
        "P {a \[GreaterEqual] " <>
            StringPadRight[ToString[list[[1]]] <> "}", 5], Red],
        " \[LessEqual] ",
        Style[StringPadRight[ToString[list[[2]]], 10], Orange],
        Style[" : p from simulation = ", Darker@Green],
        Style[ToString[list[[3]]], Blue]}];

  probabilities =
      Table[Module[{sampleSize = 10000, data, probs,
        expectation =
            Expectation[r, r \[Distributed] UniformDistribution[{0, 1000}]]},
        data = RandomReal[{0, 1000}, 10000];
        probs =
            N /@ {x, Clip[expectation / x, {0, 1}],
              Length[Select[data, # >= x &]] / sampleSize}],
        {x, 25, 1975, 25}];

  Export[StringReplace[NotebookFileName[], ".nb" -> "_part01.png"],
    TableForm[markovString /@ probabilities], ImageResolution -> 800,
    ImageSize -> 400]
]

Module[{chebyshevString, probabilities},

  chebyshevString[list_List] := styledStringJoin[{Style["P{|x - \!\(\*
StyleBox[\"\[Mu]\",\nFontWeight->\"Bold\"]\)| \[GreaterEqual] " <>
      StringPadRight[ToString[list[[1]]], 3], Red],
    "} \[LessEqual] ",
    Style[StringPadRight[ToString[list[[2]]], 10], Orange],
    Style[" : p from simulation = ", Darker@Green],
    Style[ToString[list[[3]]], Blue]}];

  probabilities =
      Table[Module[{sampleSize = 10000, data, probs, expectation = 500,
        variance = 1000^2 / 12},
        data = RandomReal[{0, 1000}, 10000];
        probs =
            N /@ {x, Clip[variance / x^2, {0, 1}],
              Length[Select[data, Abs[# - 500] >= x &]] / sampleSize}],
        {x, 25, 975, 10}];
  Export[StringReplace[NotebookFileName[], ".nb" -> "_part02.png"],
    TableForm[chebyshevString /@ probabilities], ImageResolution -> 800,
    ImageSize -> 430]

]