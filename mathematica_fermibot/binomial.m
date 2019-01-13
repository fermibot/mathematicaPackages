(* :OriginalCreationDate: 2018-07-04 *)

ClearAll[binomialStep];
binomialStep[list_List] := Module[{xPos, yPos},
  xPos = Accumulate[{0}~Join~
     Table[If[list[[r]] == 0, -0.5, 0.5], {r, 1, Length@list}]];
  yPos = -Range[0, Length@list];
  Transpose[{xPos, yPos}]
  ]

Module[{steps = 8, combinations},
 combinations = 
  Join @@ (Permutations[#] & /@ 
     Table[Join @@ {ConstantArray[0, r], 
        ConstantArray[1, steps - r]}, {r, 0, steps}]);
 Graphics[{Opacity[0.01], Line[#]} & /@ (binomialStep /@ 
     combinations), PlotRange -> {{-steps/2, steps/2}, {-steps, 0}}, 
  Frame -> True]
 ]
