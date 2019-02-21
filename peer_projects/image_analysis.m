Module[{images = FileNames["*jpg", NotebookDirectory[]], image,
  reImage1, reImage2},
  Table[
  (*image=ImageData[ImageTrim[Import[imageIn],{{395,1114},{3059,
  2122}}]];*)
    image =
        GaussianFilter[
          ImageData[
            ImageTrim[Import[imageIn], {{395, 1114}, {3059, 2122}}]], 5];
    reImage1 =
        If[And @@ (0.35 <= # >= 0.51 & /@ #), {1, 1, 1}, {0, 0,
          0}] & /@ # & /@ image // Image;
    reImage2 =
        If[And @@ (# >= 0.95 & /@ #), {1, 1, 1}, {0, 0, 0}] & /@ # & /@
            image // Image;
    EdgeDetect[ColorNegate[ImageSubtract[reImage1, reImage2]]]
  (*Column[Image[#,ImageSize\[Rule]788]&/@{image,
  reImage}]*), {imageIn, images[[2 ;; 2]]}]
]

Module[{images = FileNames["*jpg", NotebookDirectory[]], image,
  reImage1, reImage2},
  image = ImageTrim[Import[images[[3]]], {{1150, 1114}, {1350, 2122}}];
  reImage1 =
      If[And @@ (0.35 <= # >= 0.25 & /@ #), {1, 1, 1}, {0, 0,
        0}] & /@ # & /@ image // Image;
  reImage2 =
      If[And @@ (# >= 0.95 & /@ #), {1, 1, 1}, {0, 0, 0}] & /@ # & /@
          image // Image;
  image = ImageAdd[reImage1, reImage2];
  ImageColorSpace[reImage1] // Echo;
  Sharpen[ColorNegate[
    ImageSubtract[Nest[Threshold[Blur[#], "Hard"] &, image, 1],
      Nest[Threshold[Blur[#], {"Hyperbola"}] &, image, 6]]], 10]
]


Module[{
  images = FileNames["*jpg", NotebookDirectory[]], image,
  colorSeparate, imageSize = ImageSize -> 100,
  delta = {"Cluster", "Entropy", "Mean", "Median", "MinimumError"},
  tfun = {"Soft", "Hard", "Firm", "PiecewiseGarrote",
    "SmoothGarrote"}},
  image = ImageData[
    ImageTrim[Import[images[[3]]], {{1150, 1375}, {1350, 1500}}]];
  colorSeparate = ColorSeparate[Image[image]];
  Row@Table[
    Framed@Grid[
      Table[Image[
        ColorNegate@
            ImageSubtract[#, Threshold[#, {\[Phi], \[Delta]}]],
        imageSize] & /@ colorSeparate, {\[Phi], tfun}]], {\[Delta],
      delta}]
]


Module[{images = FileNames["*jpg", NotebookDirectory[]], image,
  colorSeparate, imageSize = ImageSize -> 100,
  delta = {"Cluster", "Entropy", "Mean", "Median", "MinimumError"},
  tfun = {"Soft", "Hard", "Firm", "PiecewiseGarrote",
    "SmoothGarrote"}},
  image = ImageData[
    ImageTrim[Import[images[[3]]], {{1150, 1375}, {1350, 1500}}]];
  colorSeparate = ColorSeparate[Image[image]] // Last;
  Row@{
    Framed@
        TableForm[
          Table[Tooltip[
            Image[ColorNegate@
                ImageSubtract[#, Threshold[#, {\[Phi], \[Delta]}]],
              imageSize], StringJoin @@ {\[Phi], " ", \[Delta]}] &[
            colorSeparate], {\[Phi], tfun}, {\[Delta], delta}],
          TableHeadings -> {tfun, delta}, TableAlignments -> Center],
    "\t\t",
    Framed@
        TableForm[
          Table[Tooltip[
            Image[Inpaint[Image@image,
              ImageSubtract[#, Threshold[#, {\[Phi], \[Delta]}]]],
              imageSize], StringJoin @@ {\[Phi], " ", \[Delta]}] &[
            colorSeparate], {\[Phi], tfun}, {\[Delta], delta}],
          TableHeadings -> {tfun, delta}, TableAlignments -> Center]}
]