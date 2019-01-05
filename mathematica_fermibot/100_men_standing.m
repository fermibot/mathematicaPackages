Module[{sequences, alive, replacer},
  alive[1] := Style[1, Darker@Hue[0.3], 10];
  alive[0] := Style[0, Red, 10];
  replacer[obj_] := obj -> obj - 1;
  sequences =
      Module[{list = Range[100], lists, deleter = 1}, lists = {list};

      While[Length[list] > 1,
        list = Delete[list, deleter + 1];
        deleter = Mod[deleter + 1, Length@list];
        AppendTo[lists, list]];

      Print@TableForm[
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}], TableSpacing -> {0, 0}]]]

Module[{sequences, alive, replacer, colors, images}, alive[1] := Green;
alive[0] := Red;
replacer[obj_] := obj -> obj - 1;
sequences =
    Module[{list = Range[100], lists, deleter = 1}, lists = {list};
    While[Length[list] > 1, list = Delete[list, deleter + 1];
    deleter = Mod[deleter + 1, Length@list];
    AppendTo[lists, list]];
    colors =
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}];
    images =
        Table[Graphics[{Table[{colors[[r, n]],
          Disk[{35 Sin[2 \[Pi] n / 100], 35 Cos[2 \[Pi] n / 100]}]}, {n, 1,
          Length@lists[[1]]}],
          Table[Style[
            Text[n, {35 Sin[2 \[Pi] n / 100], 35 Cos[2 \[Pi] n / 100]}],
            Black], {n, 1, Length@lists[[1]]}]}, ImageSize -> 700], {r,
          1, 100}];
    Export["100_men_standing.gif", images,
      "DisplayDurations" -> Table[0.4, 99] ~ Join ~ {5},
      AnimationRepetitions -> 20]]]

(*k=5*)
Module[{sequences, alive, replacer},
  alive[1] := Style[1, Darker@Hue[0.3], 10];
  alive[0] := Style[0, Red, 10];
  replacer[obj_] := obj -> obj - 1;
  sequences =
      Module[{list = Range[100], lists, deleter = 1}, lists = {list};

      While[Length[list] > 1,
        list = Delete[list, Mod[deleter + 1, Length@list + 1]];
        deleter = Mod[deleter + 4, Length@list];
        AppendTo[lists, list]];

      Print@TableForm[
        Table[alive /@ (Range[100] -
            ReplaceAll[Range[100], replacer /@ lists[[r]]]), {r, 1,
          Length@lists}], TableSpacing -> {0, 0}]]]