Graphics[Table[{Hue[(n + m) / 50],
  EdgeForm[{Hue[Abs[1 - (n + m) / 50]], Opacity[.2], Thin}],
  Opacity[.2],
  Rotate[Rectangle[{n, m}, {n + 1, m + 1}], (n + m) / 50]}, {n, 0,
  20}, {m, 0, 10}], ImageSize -> 1000]

Graphics[
  {
    Table[{Hue[(n + m) / 50], EdgeForm[Hue[Abs[1 - (n + m) / 50]]],
      Opacity[.2],
      Rotate[Rectangle[{n, m}, {n + 1, m + 1}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 20}, {m, 0, 10}],
    {Table[{Opacity[.2], Hue[RandomReal[{0, 1}]],
      Line[{{RandomInteger[{0, 20}] + .5,
        RandomInteger[{0, 10}] + .5}, {RandomInteger[{0, 20}] + .5,
        RandomInteger[{0, 10}] + .5}}]}, {n, 1, 200}]}
  }, ImageSize -> 1000]

Graphics[
  {
    Table[{Hue[RandomReal[{0.5, 0.6}]],
      EdgeForm[Hue[RandomReal[{0.5, 0.6}]]], Opacity[.2],
      Rotate[Rectangle[{n, m}, {n + 1.5, m + 1.5}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 60}, {m, 0, 30}]
  }, ImageSize -> 1200]

Graphics[
  {
    Table[{Hue[RandomReal[{0.5, 0.6}]],
      EdgeForm[{Hue[RandomReal[{0.5, 0.6}]], Opacity[.2]}],
      Opacity[.01],
      Rotate[Rectangle[{n, m}, {n + 1.5, m + 1.5}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 60}, {m, 0, 30}]
  }, ImageSize -> 1200]

Graphics[
  {
    Table[{Hue[RandomReal[{0.5, 0.6}]], Opacity[1],
      Rotate[Rectangle[{n, m}, {n + 2, m + 2}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 60}, {m, 0, 30}]
  }, ImageSize -> 1200]

Graphics[
  {
    Table[{Hue[RandomReal[{0.0, 0.99}]], Opacity[.4],
      Rotate[Rectangle[{n, m}, {n + 2, m + 2}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 60}, {m, 0, 30}]
  }, ImageSize -> 1200]

Graphics[
  {
    Table[{Hue[RandomReal[{0.0, 0.99}]], Opacity[.1],
      Rotate[Rectangle[{n, m}, {n + 2, m + 2}],
        RandomReal[{-\[Pi], \[Pi]}]]}, {n, 0, 60}, {m, 0, 30}]
  }, ImageSize -> 1200]

Graphics[Table[{Opacity[.5], Hue[RandomReal[]], Disk[{n, m}, 1]}, {n,
  1, 20}, {m, 1, 20}], ImageSize -> 600]