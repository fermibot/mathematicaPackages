data0 = Table[{{n, m}, RandomReal[{-1, 1}]}, {n, 0, 128, 32}, {m, 0, 128, 32}]; int0 = Interpolation[Flatten[data0, 1]];
data1 = Table[{{n, m}, RandomReal[{-1, 1}] / 2}, {n, 0, 128, 16}, {m, 0, 128, 16}]; int1 = Interpolation[Flatten[data1, 1]];
data2 = Table[{{n, m}, RandomReal[{-1, 1}] / 4}, {n, 0, 128, 08}, {m, 0, 128, 08}]; int2 = Interpolation[Flatten[data2, 1]];
data3 = Table[{{n, m}, RandomReal[{-1, 1}] / 8}, {n, 0, 128, 04}, {m, 0, 128, 04}]; int3 = Interpolation[Flatten[data3, 1]];
data4 = Table[{{n, m}, RandomReal[{-1, 1}] / 16}, {n, 0, 128, 02}, {m, 0, 128, 02}]; int4 = Interpolation[Flatten[data4, 1]];
data5 = Table[{{n, m}, RandomReal[{-1, 1}] / 32}, {n, 0, 128, 01}, {m, 0, 128, 01}]; int5 = Interpolation[Flatten[data5, 1]];
data6 = Table[{{n, m}, RandomReal[{-1, 1}] / 64}, {n, 0, 128, 0.5}, {m, 0, 128, 0.5}]; int6 = Interpolation[Flatten[data6, 1]];
data7 = Table[{{n, m}, RandomReal[{-1, 1}] / 128}, {n, 0, 128, 0.25}, {m, 0, 128, 0.25}]; int7 = Interpolation[Flatten[data7, 1]];
data8 = Table[{{n, m}, RandomReal[{-1, 1}] / 256}, {n, 0, 128, 0.125}, {m, 0, 128, 0.125}]; int8 = Interpolation[Flatten[data8, 1]];
data9 = Table[{{n, m}, RandomReal[{-1, 1}] / 512}, {n, 0, 128, 0.0625}, {m, 0, 128, 0.0625}]; int9 = Interpolation[Flatten[data9, 1]];

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 50, PlotPoints -> 100,
  ColorFunction -> "AlpineColors"];


DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "ArmyColors"]


DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "AtlanticColors"]


DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "AuroraColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "AvocadoColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "BeachColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "CandyColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "CMYKColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "DeepSeaColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "FallColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "FruitPunchColors"]

DensityPlot[
  int0[x, y] + int1[x, y] + int2[x, y] + int3[x, y] + int4[x, y] +
      int5[x, y] + int6[x, y] + int7[x, y] + int8[x, y] + int9[x, y], {x,
  0, 128}, {y, 0, 128}, AspectRatio -> 1 / 1, Frame -> False,
  WorkingPrecision -> 200, PlotPoints -> 100,
  ColorFunction -> "IslandColors"]