Subscript[r, x] = Cos[t]; Subscript[r, y] = Sin[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 10}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      2 \[Pi], \[Pi] / 10}], 0]]}];(*Normal*)
Show[a, b, PlotRange -> All, Background -> Black]


Subscript[r, x] = Cos[2 t]; Subscript[r, y] = t Sin[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      2 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black]

Subscript[r, x] = Cos[t] E^(-0.1 t); Subscript[r, y] =
    Sin[t] E^(-0.1 t);
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black]

Manipulate[Subscript[r, x] = Cos[t] E^(-d t);
Subscript[r, y] = Sin[t] E^(-d t);
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black], {d, 0,
  0.1, .01}]


Subscript[r, x] = Cos[t]; Subscript[r, y] = Sin[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 10}], 0]]}];(*Tangent*)
Show[a, b, PlotRange -> All, Background -> Black]
picts2 = Table[
  DensityPlot[
    Sin[x^2 + y^2] + Sin[(x - a)^2 + y^2], {x, -2 \[Pi],
    2 \[Pi]}, {y, -2 \[Pi], 2 \[Pi]}, Frame -> False,
    PlotPoints -> 60], {a, -5, 5, 0.1}];
Export["C:\Documents and Settings\alcatraz\Desktop\anipic.gif",
  picts2, "GIF"];


ParametricPlot[{(3 + Sin[3 t]) Sin[t], (3 + Sin[3 t]) Cos[t]}, {t, 0,
  2 \[Pi]}]

Subscript[r, x] = (3 + Sin[3 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[3 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Arrowheads[0.01],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[4 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[4 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Arrowheads[0.01],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 200}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Arrowheads[0.01],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[6 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[6 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Opacity[0.5], Arrowheads[0.01],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[10 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[10 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Opacity[0.5],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[7 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[7 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Opacity[0.5],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[2 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[2 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.5], Opacity[0.5],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]


Table[Export[
  FileNameJoin[StringJoin["Envelope[", ToString[f], "].png"]],
  Subscript[r, x] = (3 + Sin[f t]) Sin[t];
  Subscript[r, y] = (3 + Sin[f t]) Cos[t];
  ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0, 2 \[Pi]},
    Frame -> False, Axes -> False,
    PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
    Mesh -> None, Background -> Black],
  ImageSize -> 700], {f, 1, 10, 1}]


Table[Export[
  FileNameJoin[StringJoin["Transform[", ToString[f], "].png"]],
  Subscript[r, x] = (3 + Sin[0.001 f t]) Sin[t];
  Subscript[r, y] = (3 + Sin[0.001 f t]) Cos[t];
  tang = D[{Subscript[r, x], Subscript[r, y]}, {t, 1}];(*Tangent;
  First Derivative*)
  norm = D[{Subscript[r, x], Subscript[r, y]}, {t, 2}];(*Normal;
  Decond Derivative*)
  a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
    2 \[Pi]}, Frame -> False, Axes -> False,
    PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
    Mesh -> None];
  b = Graphics[{Hue[0.5], Opacity[0.5],
    Line[Flatten[
      Table[{{Subscript[r, x], Subscript[r,
        y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
        2 \[Pi], \[Pi] / 400}], 0]]}];(*Tangent*)
  (*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[
  Table[{{Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[
  r, y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
  Show[a, b, PlotRange -> All, Background -> Black],
  ImageSize -> 700], {f, 4000, 5000, 1}]

Subscript[r, x] = (3 + Sin[f t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[f t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21];
Show[a, PlotRange -> {{-8, 8}, {-8, 8}}, Background -> Black]


Table[Export[
  FileNameJoin[StringJoin["Envelope[", ToString[f], "].png"]],
  Subscript[r, x] = (3 + Sin[f t]) Sin[t];
  Subscript[r, y] = (3 + Sin[f t]) Cos[t];
  tang = D[{Subscript[r, x], Subscript[r, y]}, {t, 1}];(*Tangent;
  First Derivative*)
  a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
    2 \[Pi]}, Frame -> False, Axes -> False,
    PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21];
  Show[a, PlotRange -> {{-8, 8}, {-8, 8}}, Background -> Black],
  ImageSize -> 700], {f, 5, 5, 0}]


Subscript[r, x] = Cos[t] E^(-0.1 t); Subscript[r, y] =
    Sin[t] E^(-0.1 t);
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black]

Manipulate[Subscript[r, x] = Cos[t] E^(-d t);
Subscript[r, y] = Sin[t] E^(-d t);
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black], {d, 0,
  0.1, .01}]

Subscript[r, x] = Cos[2 t + t] E^(-0.1 t); Subscript[r, y] =
    Sin[3 t] E^(-0.1 t);
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 11];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, 0,
      2 \[Pi], \[Pi] / 20}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      2 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, c, PlotRange -> All, Background -> Black]


Subscript[r, x] = (3 + Sin[3 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[3 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 0];
b = Graphics[{Hue[0.2], Arrowheads[0.01],
  Arrow[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, 0,
      4 \[Pi], \[Pi] / 20}], 0]]}];(*Normal*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (3 + Sin[3 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[3 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], Specularity -> None}, PlotPoints -> 21,
  Mesh -> 0];
b = Graphics[{Hue[0.3], Opacity[0.05],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} +
        0.5 norm}, {t, \[Pi] / 2000, 2 \[Pi], \[Pi] / 2000}],
    0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
Show[a, b, PlotRange -> All, Background -> Black]

Subscript[r, x] = (5 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {White, Thickness[0.002]}];
b = Graphics[{Hue[0.7], Opacity[0.05],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        1000, 20 \[Pi], \[Pi] / 1000}], 0]]}];(*Tangent*)
c = Graphics[{Hue[0.55], Opacity[0.05],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r,
      y]} + .4 norm}, {t, \[Pi] / 100, 2 \[Pi], \[Pi] / 100}],
    0]]}];(*Normal*)
Show[b, c, PlotRange -> All, Background -> Black]

Subscript[r, x] = (5 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False, PlotStyle -> Hue[0.4]];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{Hue[.55], Opacity[0.2], Thickness[0],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r,
      y]} + .5 norm}, {t, \[Pi] / 200, 2 \[Pi], \[Pi] / 200}],
    0]]}];(*Normal*)
d = Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (5 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False, PlotStyle -> Red];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{Hue[.55], Opacity[0.5], Thickness[0],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r,
      y]} + .5 norm}, {t, \[Pi] / (720 2), 2 \[Pi], \[Pi] / (720 2)}],
    0]]}];(*Normal*)
d = Show[c, a, Background -> Black, PlotRange -> {{-1, 1}, {-1, 1}}]

Subscript[r, x] = (5 + Sin[6 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[6 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.000], Hue[0.55]}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.05], Thickness[0.001],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} +
        0.2 norm}, {t, \[Pi] / 2000, 2 \[Pi], \[Pi] / 2000}],
    0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (5 + Sin[4 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[4 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{Hue[0.2], Opacity[0.05], Thickness[0.000],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} +
        0.5 norm}, {t, \[Pi] / 2000, 2 \[Pi], \[Pi] / 2000}],
    0]]}];(*Normal*)
d = Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (5 + Sin[5 t] - 0.5 Sin[2.5 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[5 t] - 0.5 Sin[2.5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False, PlotStyle -> Red];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.5],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} +
        0.1 norm}, {t, \[Pi] / 360, 2 \[Pi], \[Pi] / 360}],
    0]]}];(*Normal*)
d = Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (40 + Sin[4 t]) Sin[
  t]; Subscript[r, y] = (40 + Sin[4 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.05], Thickness[0.001],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        2000, 2 \[Pi], \[Pi] / 2000}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (50 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (50 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00000], White}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{Hue[.45], Opacity[0.2], Thickness[0.000],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        200, 2 \[Pi], \[Pi] / 200}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (60 + Sin[6 t]) Sin[
  t]; Subscript[r, y] = (60 + Sin[6 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.5], Thickness[0.001],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        200, 2 \[Pi], \[Pi] / 200}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (60 + Sin[6 t]) Sin[
  t]; Subscript[r, y] = (60 + Sin[6 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.0000], Hue[.6]}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{Hue[0.75], Opacity[0.05], Thickness[0.000],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        2000, 2 \[Pi], \[Pi] / 2000}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (50 + Sin[7 t]) Sin[
  t]; Subscript[r, y] = (50 + Sin[7 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.5], Thickness[0.001],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        200, 2 \[Pi], \[Pi] / 200}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (50 + Sin[7 t]) Sin[
  t]; Subscript[r, y] = (50 + Sin[7 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.05], Thickness[0.000],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        1000, 2 \[Pi], \[Pi] / 1000}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (50 + 3 Sin[7 t]) Sin[
  t]; Subscript[r, y] = (50 + 3 Sin[7 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], LightBlue}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.05], Thickness[0.000],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        2000, 2 \[Pi], \[Pi] / 2000}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> All, Background -> Black]

Subscript[r, x] = (50 + 3 Sin[7 t]) Sin[
  t]; Subscript[r, y] = (50 + 3 Sin[7 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Thickness[0.00002], Red}];
(*b=Graphics[{Hue[0.7],Opacity[0.5],Line[Flatten[Table[{{Subscript[r, \
x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+tang},{t,\[Pi]/200,20\[Pi],\[Pi]/200}],0]]}];(*Tangent*)*)
c = Graphics[{White, Opacity[0.3], Thickness[0.0001],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + norm}, {t, \[Pi] /
        2000, 2 \[Pi], \[Pi] / 2000}], 0]]}];(*Normal*)
Show[c, a, PlotRange -> {{-5, 5}, {-5, 5}}, Background -> Black]



Subscript[r, x] = (5 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (5 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False, PlotStyle -> Red];
c = Graphics[{Hue[.55], Opacity[0.5], Thickness[0],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r,
      y]} + .5 norm}, {t, \[Pi] / (720 2), 2 \[Pi], \[Pi] / (720 2)}],
    0]]}];(*Normal*)
d = Show[c, a, Background -> Black, PlotRange -> {{-1, 1}, {-1, 1}}];
cells = SelectComponents[
  DeleteBorderComponents[Binarize[d, {0, .7}]], {"Area", "Holes"},
  100 < #1 < 1000 && #2 > 0 &];
circles =
    ComponentMeasurements[
      ImageMultiply[d, cells], {"Centroid", "EquivalentDiskRadius"}][[
        All, 2]];
Show[d, Graphics[{Red, Thick, Circle @@ # & /@ circles}]]


