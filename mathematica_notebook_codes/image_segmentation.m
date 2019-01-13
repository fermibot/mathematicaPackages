(* :Title: image_segmentation *)
(* :Context: image_segmentation` *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

ClearAll[segmentExport]
segmentExport[imageIn_] :=
    Table[Module[{seg = Power[2, p], img, imgdim},
      img = ImageData[imageIn];
      imgdim = Dimensions[img];
      Export[StringJoin["Image_", ToString[p], ".png"],
        Graphics[
          Table[{RGBColor[img[[m, n]]],
            Rotate[Rectangle[{n / seg, (imgdim[[2]] - m) / seg}],
              RandomReal[{0, \[Pi]}]]}, {n, imgdim[[1]], 1, -seg}, {m, 1,
            imgdim[[2]], seg}], ImageSize -> 512]]], {p, 9, 0, -1}]

segmentExport[ExampleData[{"TestImage", "Lena"}]]

segmentExport[ExampleData[{"TestImage", "F16"}]]

segmentExport[] ExampleData[{"TestImage", "Girl2"}]

segmentExport[ExampleData[{"TestImage", "Girl3"}]]

segmentExport[ExampleData[{"TestImage", "Lena"}]]

segmentExport[ExampleData[{"TestImage", "F16"}]]

Module[{img = ImageData[ExampleData[{"TestImage", "Lena"}]], imgdim},
  imgdim = Dimensions[img];
  Graphics[
    Table[{RGBColor[img[[m, n]]],
      Disk[.04 {n, imgdim[[2]] - m}, 0.1]}, {n, imgdim[[1]], 1, -4}, {m,
      1, imgdim[[2]], 4}], ImageSize -> 1200]]

l = ExampleData["TestImage"];
Grid[Partition[
  Table[StringJoin[ToString[l[[n, 2]]],
    ToString[
      Dimensions[ImageData@ExampleData[{l[[n, 1]], l[[n, 2]]}]]]], {n,
    1, Length[l]}], 5]]