ClearAll[TTuple];
TTuple[list_?ListQ, level_?IntegerQ] :=
    Module[{mlevel = level, l = Length@list},
      Table[
        Flatten@
            Table[
              Table[
                Table[
                  list[[r]], l^(level - 1 - n)
                ]
                , {r, 1, l}]
              , l^n]
        , {n, 0, level - 1, 1}
      ]
    ]
TableForm@Transpose@TTuple[{"yes", "no", "maybe", "Hwat?"}, 2]