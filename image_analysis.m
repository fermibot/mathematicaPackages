Module[{images = FileNames["*jpg", NotebookDirectory[]], image,
  reImage},
  Table[image =
      ImageData[ImageTrim[Import[imageIn], {{395, 1114}, {3059, 2122}}]];
  reImage =
      If[And @@ (# >= 0.50 & /@ #), {1, 1, 1}, {0, 0, 0}] & /@ # & /@
          image // Image;
  ImageCollage[Image /@ {image, reImage},
    ImageSize -> 1200], {imageIn, images}]
]