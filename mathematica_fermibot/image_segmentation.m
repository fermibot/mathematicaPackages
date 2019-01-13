(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)
(* :OriginalCreationDate: 2017-06-08 *)

img = ImageData[ExampleData[{"TestImage", "Girl3"}]];
imgdim = Dimensions[img]
Graphics[Table[{RGBColor[img[[m, n]]],
  Triangle[{t = {.2 n, .2 (imgdim[[2]] - m)},
    t + RandomReal[{-.4, .4}, 2],
    t + RandomReal[{-.4, .4}, 2]}]}, {n, imgdim[[1]], 1, -1}, {m, 1,
  imgdim[[2]], 1}], ImageSize -> 1200]

img = ImageData[ExampleData[{"TestImage", "Mandrill"}]];
imgdim = Dimensions[img]
Graphics[Table[{RGBColor[img[[m, n]]],
  Triangle[{t = {.2 n, .2 (imgdim[[2]] - m)},
    t + RandomReal[{-.4, .4}, 2],
    t + RandomReal[{-.4, .4}, 2]}]}, {n, imgdim[[1]], 1, -1}, {m, 1,
  imgdim[[2]], 1}], ImageSize -> 1200]

ExampleData["TestImage"]

img = ImageData[ExampleData[{"TestImage", "Lena"}]];
imgdim = Dimensions[img]
Graphics[Table[{RGBColor[img[[m, n]]],
  Disk[.04 {n, imgdim[[2]] - m}, 0.1]}, {n, imgdim[[1]], 1, -4}, {m,
  1, imgdim[[2]], 4}], ImageSize -> 1200]