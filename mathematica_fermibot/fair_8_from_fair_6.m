(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-07-24 *)

Module[{fairEightTree,
  fairSix := Ceiling[Divide[RandomInteger[{1, 6}], 3]]},
  fairEightTree =
      <|1 -> <|1 -> <|1 -> 1, 2 -> 2|>, 2 -> <|1 -> 3, 2 -> 4|>|>,
        2 -> <|1 -> <|1 -> 5, 2 -> 6|>, 2 -> <|1 -> 7, 2 -> 8|>|>|>;
  Histogram[Table[fairEightTree[fairSix][fairSix][fairSix], 100000]]
]