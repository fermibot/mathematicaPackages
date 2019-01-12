Module[{data = (Count[#, 1] - Count[#, 0]) & /@
    RandomChoice[{0, 1}, {1000000, 100}]},
  Histogram[data, {1}, PlotLabel -> Style["Differences\n", 20],
    LabelingFunction -> (Placed[Rotate[#, 90 \[Degree]], Above] &),
    ImageSize -> 788, ChartStyle -> LightBlue]]

Export[StringReplace[NotebookFileName[], ".nb" -> "_chart.png"], %,
ImageSize -> 788, ImageResolution -> 1000]