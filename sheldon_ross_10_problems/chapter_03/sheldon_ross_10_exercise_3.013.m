AppendTo[$Path, "D:\\Mathematica Files 4K\\mathematicaPackages"];
Needs["utilities`"];

ClearAll[NumberQSelect]
NumberQSelect[list_List] :=
    Select[list, And @@ {NumberQ[#[[1]]], NumberQ[#[[2]]]} &]
ListLinePlot[
  Table[NumberQSelect[
    Table[{r,
      Mean[Select[
        RandomVariate[ExponentialDistribution[r],
          1000], # > 1 &]]}, {r, 1, 5, 0.1}]], {t, 200}] ~
      Join ~ {{#, 1 + Divide[1, #]} & /@ Range[1, 5, 0.1]},
  InterpolationOrder -> 2, Joined -> True,
  PlotStyle -> (({Opacity@0.1, Darker@Green, Thickness@0} & /@
      Range[200]) ~ Join ~ {{Dashed, Black, Thick}}), Frame -> True,
  ImageSize -> 788, AspectRatio -> 1, PlotRange -> {{0, 5}, {0, 2.5}},
  PlotLegends -> {utilities`stringJoinStyled[{Style["---", Black],
    " Theory"}],
    utilities`stringJoinStyled[{Style["---", Darker@Green],
      " Simulation"}]},
  FrameLabel -> (Style[#, 16] & /@ {"\[Lambda]",
    "E[ X|X>1,\[Lambda] ]"})]