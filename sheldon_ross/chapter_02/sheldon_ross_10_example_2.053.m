ClearAll[circumventer, circleSequence, particleInCircle,
  particleInCircleExport];

circumventer[n_, size_ : 10] := Mod[Abs[size + n], size]

circleSequence[n_ : 10, radius_ : 10, activeIn_List] :=
    Module[{active = activeIn + 1},
      Table[{
        If[active[[2]] == r, {Opacity[1.0], Green,
          Disk[{radius Sin[2 r \[Pi] / n], radius Cos[2 r \[Pi] / n]}]},
          If[active[[1]] == r, {Opacity[0.2], Green,
            Disk[{radius Sin[2 r \[Pi] / n], radius Cos[2 r \[Pi] / n]}]},
            {Opacity[1.0], Green,
              Circle[{radius Sin[2 r \[Pi] / n],
                radius Cos[2 r \[Pi] / n]}]}]]}, {r, 1, n}]
          ~ Join ~
          {Lighter@Blue,
            Arrow[{radius {Sin[2 active[[1]] \[Pi] / n],
              Cos[2 active[[1]] \[Pi] / n]},
              radius {Sin[2 active[[2]] \[Pi] / n],
                Cos[2 active[[2]] \[Pi] / n]}}]}
    ]

particleInCircle[\[Gamma]_ : 10, sample_ : 1000] :=
    Module[{preverse = {0}, simulation, pairs},
      Table[AppendTo[preverse, RandomChoice[{-1, 1}]], sample];
      simulation = circumventer[#, \[Gamma]] & /@ Accumulate[preverse];
      pairs = Transpose[{Drop[simulation, -1], Rest[simulation]}];
      Manipulate[
        Graphics[circleSequence[\[Gamma], 12, pairs[[r]]],
          ImageSize -> 350], {r, 1, Length@pairs, 1}]
    ]

particleInCircleExport[\[Gamma]_ : 10, sample_ : 1000] :=
    Module[{preverse = {0}, simulation, pairs},
      Table[AppendTo[preverse, RandomChoice[{-1, 1}]], sample];
      simulation = circumventer[#, \[Gamma]] & /@ Accumulate[preverse];
      pairs = Transpose[{Drop[simulation, -1], Rest[simulation]}];
      Table[Graphics[circleSequence[\[Gamma], 12, pairs[[r]]]], {r, 1,
        Length@pairs, 1}]
    ]


Export[StringReplace[NotebookFileName[],
  ".nb" -> "_animation_" <> ToString[#[[1]]] <> "_" <>
      ToString[#[[2]]] <> ".gif"],
  particleInCircleExport[#[[1]], #[[2]]],
  ImageSize -> 350, ImageResolution -> 200,
  "DisplaDurations" -> 0.2] & /@
    {{15, 1000}, {20, 1000}, {25, 1000}, {30, 1000}}