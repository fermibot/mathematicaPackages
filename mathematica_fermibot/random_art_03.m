(* :OriginalCreationDate: 2016-06-22 *)

Histogram3D[
 Table[{RandomReal[] RandomReal[], RandomReal[] RandomReal[]}, {n, 1,
   100000}], ImageSize -> 1000]

Graphics[Table[
  Rotate[{Opacity[0.01], Green, EdgeForm[{Thin, Red, Opacity[0.1]}],
    Rectangle[{-r, -r}, {r, r}]}, r^2], {r, 0, 10 \[Pi], \[Pi]/10}]]

Graphics[Table[
  Rotate[{Opacity[0.017], Pink,
    EdgeForm[{Thin,
      RandomChoice[{Green, Darker[Green], Lighter[Blue]}],
      Opacity[0.15]}], Rectangle[{-r, -r}, {r, r}]}, r^2], {r, \[Pi],
   10 \[Pi], \[Pi]/13}]]

Export["Rose_2.png", "image", ImageSize -> 700]

Export["Rose_2_HighRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{Opacity[0.01], Pink,
    EdgeForm[{Thin,
      RandomChoice[{Green, Darker[Green], Lighter[Blue]}],
      Opacity[0.1]}],
    Rectangle[{-r + (r/100 RandomReal[r {-1, 1}]), -r + (r/
         100 RandomReal[r {-1, 1}])}, {r + (r/
         100 RandomReal[r {-1, 1}]),
      r + (r/100 RandomReal[r {-1, 1}])}]}, r^2], {r, \[Pi],
   5 \[Pi], \[Pi]/30}]]

Graphics[Table[
  Rotate[{Opacity[0.017], Pink,
    EdgeForm[{Thin,
      RandomChoice[{Green, Darker[Green], Lighter[Blue]}],
      Opacity[0.15]}], Rectangle[{-r, -r}, {r, r}]},
   r^2 + 1000 RandomReal[{1/r, -(1/r)}]], {r, \[Pi], 10 \[Pi], \[Pi]/
   13}]]

Graphics[Table[
  Rectangle[{n, m}, {n + .9, m + .9}], {n, -10, 10, 1}, {m, -5, 5,
   1}], ImageSize -> 700]

Graphics[Table[
  Rotate[Rectangle[{n, m}, {n + .9, m + .9}], Abs[n + m]/15], {n, -10,
    10, 1}, {m, -5, 5, 1}], ImageSize -> 700]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.1, .2}]],
    Rectangle[{n, m}, {n + .9, m + .9}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
   1}], ImageSize -> 700]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.1, .2}]],
    Rectangle[{n, m}, {n + .9, m + .9}]}, 0], {n, -10, 10, 1}, {m, -5,
    5, 1}], ImageSize -> 700]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.1, .2}]],
    Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
   1}], ImageSize -> 700]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.1, .2}]], Opacity[.1],
    Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
   1}], ImageSize -> 700]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[RandomReal[{.1, .2}]], Opacity[.1],
     Rectangle[{n, m}, {n + t, m + t}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700], {t, 0, 1, 0.01}]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[RandomReal[{.1, .12}]], Opacity[.1],
     Rectangle[{n, m}, {n + t, m + t}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700], {t, 0, 1, 0.01}]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[RandomReal[{.9, 1}]], Opacity[.6],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700, Background -> Black], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[RandomReal[{.1, .2}]], Opacity[.6],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[RandomReal[{.7, .9}]], Opacity[1],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{GrayLevel[.8], Opacity[1],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700], {t, 0.01, 1, 0.02}]

a = Table[
   Graphics[
    Table[Rotate[{GrayLevel[.7], Opacity[1],
       Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
      RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
      1}], ImageSize -> 700], {t, 0.01, 1, 0.02}];
Export["Canvas_Animation.gif", a, ImageSize -> 700]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.1, .2}]],
    Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
   1}], ImageSize -> 700]

Manipulate[
 Graphics[Table[
   Rotate[{Hue[RandomReal[{.14, .19}]], Opacity[.6],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700, Background -> Black], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{Hue[RandomReal[{.14, .19}]], Opacity[.6],
     Rectangle[{n, m}, {n + .97 + 0 t^0, m + .97 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700, Background -> Black], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{Hue[RandomReal[{.14, .16}]], Opacity[.6],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -10, 10, 1}, {m, -5, 5,
    1}], ImageSize -> 700, Background -> Black], {t, 0.01, 1, 0.02}]

Manipulate[
 Graphics[Table[
   Rotate[{Hue[RandomReal[{.14, .16}]], Opacity[.6],
     Rectangle[{n, m}, {n + 1 + 0 t^0, m + 1 + 0 t^0}]},
    RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
    1}], ImageSize -> 700, Background -> Black], {t, 0.01, 1, 0.02}]

Graphics[Table[
  Rotate[{Hue[RandomReal[{.14, .16}]], Opacity[.6],
    Rectangle[{n, m}, {n + 1, m + 1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> Black]

Export["Post_It_LoRes.png", "image", ImageSize -> 700]
Export["Post_It_HiRes.png", "image", ImageSize -> 3000]
im = Graphics[
  Table[Rectangle[{n, m}, {n + .9, m + .9}], {n, -14, 14, 1}, {m, -7,
    7, 1}], ImageSize -> 700]

Export["Rec_Array_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_HiRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.74, .96}]], Opacity[.6],
    Rectangle[{n, m}, {n + 1, m + 1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> Black]

Export["Rec_Array_GrSc_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_GrSc_HiRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.74, .96}]], Opacity[.6],
    Rectangle[{n, m}, {n + 1 + RandomReal[{-1/25, 1/25}],
      m + 1 + RandomReal[{-1/50, 1/50}]}]},
   RandomReal[{-\[Pi]/25, \[Pi]/25}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> Black]

Export["Rec_Array_GrSc_RP_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_GrSc_RP_HiRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{Hue[RandomReal[{.14, .16}]], Opacity[.6],
    Rectangle[{n, m}, {n + 1 + RandomReal[{-1/40, 1/40}],
      m + 1 + RandomReal[{-1/40, 1/40}]}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> Black]

Export["Rec_Array_Yellow_RP_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_Yellow_RP_HiRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{Hue[RandomReal[{.0, .1}]], Opacity[.6],
    Rectangle[{n, m}, {n + 1 + RandomReal[{-1/40, 1/40}],
      m + 1 + RandomReal[{-1/40, 1/40}]}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> White]

Export["Rec_Array_Yellow_RP_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_Yellow_RP_HiRes.png", "image", ImageSize -> 3000]

Table[Export[StringJoin["Color_", ToString[r], ".png"],
  Graphics[Table[
    Rotate[{Hue[RandomReal[{r, r + 0.1}]], Opacity[.6],
      Rectangle[{n, m}, {n + 1 + RandomReal[{-1/40, 1/40}],
        m + 1 + RandomReal[{-1/40, 1/40}]}]},
     RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
     1}], ImageSize -> 700, Background -> White]], {r, 0, .9, .1}]

Table[Export[StringJoin["Color_", ToString[r], "HiRes.png"],
  Graphics[Table[
    Rotate[{Hue[RandomReal[{r, r + 0.1}]], Opacity[.6],
      Rectangle[{n, m}, {n + 1 + RandomReal[{-1/40, 1/40}],
        m + 1 + RandomReal[{-1/40, 1/40}]}]},
     RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
     1}], ImageSize -> 3000, Background -> White]], {r, 0, .9, .1}]

Table[Export[StringJoin["Color_Canvas_HiRes_", ToString[r], ".png"],
  Graphics[Table[
    Rotate[{Hue[RandomReal[{r, r + 0.1}]], Opacity[1],
      Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
     RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
     1}], ImageSize -> 3000, Background -> White]], {r, 0, .9, .1}]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.5, .9}]], Opacity[1],
    Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
   RandomReal[{-\[Pi]/50, \[Pi]/50}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> White]

Export["Rec_Array_GS_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_GS_HiRes.png", "image", ImageSize -> 3000]

Graphics[Table[
  Rotate[{GrayLevel[RandomReal[{.5, .9}]], Opacity[1],
    Rectangle[{n, m}, {n + 1.1, m + 1.1}]},
   RandomReal[{-\[Pi]/20, \[Pi]/20}]], {n, -14, 14, 1}, {m, -7, 7,
   1}], ImageSize -> 700, Background -> White]

Export["Rec_Array_GS_DisVer_LoRes.png", "image", ImageSize -> 700]
Export["Rec_Array_GS_DisVer_HiRes.png", "image", ImageSize -> 3000]

