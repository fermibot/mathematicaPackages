Module[{images = FileNames["*", NotebookDirectory[]]},
  Image[ImageTrim[Import[images[[1]]], {{395, 750}, {3059, 2122}}],
    ImageSize -> 1200]
]