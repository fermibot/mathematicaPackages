no = 1000;
op = Opacity[0.1];
Subscript[r, x] = (3 + Sin[3 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[3 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.2], Specularity -> None}, PlotPoints -> 21,
  Mesh -> None];
b = Graphics[{Hue[0.2], op,
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        no, 2 \[Pi], \[Pi] / no}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
c = Show[a, b, PlotRange -> All, Background -> Black]

Export[StringJoin["Tang_3lob_lres", ToString[no], ".png"], c,
  ImageSize -> 700]
Export[StringJoin["Tang_3lob_hres", ToString[no], ".png"], c,
  ImageSize -> 2000]

no = 5000;
op = Opacity[0.02];
Subscript[r, x] = (3 + Sin[4 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[4 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], op, Specularity -> None}, PlotPoints -> 21,
  Mesh -> None];
b = Graphics[{Hue[0.5], op,
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        no, 2 \[Pi], \[Pi] / no}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
c = Show[a, b, PlotRange -> All, Background -> Black]

Export[StringJoin["Tang_4lob_lres", ToString[no], ".png"], c,
  ImageSize -> 700]
Export[StringJoin["Tang_4lob_hres", ToString[no], ".png"], c,
  ImageSize -> 2000]

no = 4000;
op = Opacity[0.02];
Subscript[r, x] = (3 + Sin[5 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[5 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.4], Specularity -> None}, PlotPoints -> 21,
  Mesh -> None];
b = Graphics[{Hue[0.4], op,
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        no, 2 \[Pi], \[Pi] / no}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
c = Show[a, b, PlotRange -> All, Background -> Black]

Export[StringJoin["Tang_5lob_lres", ToString[no], ".png"], c,
  ImageSize -> 700]
Export[StringJoin["Tang_5lob_hres", ToString[no], ".png"], c,
  ImageSize -> 2000]

no = 5000;
op = Opacity[0.015];
Subscript[r, x] = (3 + Sin[6 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[6 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {White, Specularity -> None}, PlotPoints -> 21,
  Mesh -> None];
b = Graphics[{White, op,
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        no, 2 \[Pi], \[Pi] / no}], 0]]}];(*Tangent*)
(*c=Graphics[{Hue[0.2],Arrowheads[0.01],Arrow[Flatten[Table[{{\
Subscript[r, x],Subscript[r, y]},{Subscript[r, x],Subscript[r, \
y]}+norm},{t,0,4\[Pi],\[Pi]/20}],0]]}];(*Normal*)*)
c = Show[a, b, PlotRange -> All, Background -> Black]

Export[StringJoin["Tang_6lob_lres", ToString[no], ".png"], c,
  ImageSize -> 700]
Export[StringJoin["Tang_6lob_hres", ToString[no], ".png"], c,
  ImageSize -> 2000]

no = 100;
op = Opacity[0.4];
Subscript[r, x] = (3 + Sin[10 t]) Sin[
  t]; Subscript[r, y] = (3 + Sin[10 t]) Cos[t];
tang = D[{Subscript[r, x], Subscript[r, y]}, {t,
  1}];(*Tangent; First Derivative*)
norm = D[{Subscript[r, x], Subscript[r, y]}, {t,
  2}];(*Normal; Decond Derivative*)
a = ParametricPlot[{Subscript[r, x], Subscript[r, y]}, {t, 0,
  2 \[Pi]}, Frame -> False, Axes -> False,
  PlotStyle -> {Hue[0.5], op, Specularity -> None}, PlotPoints -> 21,
  Mesh -> None];
b = Graphics[{Hue[0.5], Opacity[0.5],
  Line[Flatten[
    Table[{{Subscript[r, x], Subscript[r,
      y]}, {Subscript[r, x], Subscript[r, y]} + tang}, {t, \[Pi] /
        no, 2 \[Pi], \[Pi] / no}], 0]]}];(*Tangent*)
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