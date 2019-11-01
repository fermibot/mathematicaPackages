#!/usr/bin/env wolframscript

(* Wolfram Script *)
(* Created by the Wolfram Language Plugin for IntelliJ, see http://wlplugin.halirutan.de/ *)
(* :Author: Alcatraz *)
(* :Date: 2019-10-30 *)

Module[
  {configurations = <||>, topKeys},
  configurations["NoGapNoOffset"] = <|
    "Upper" -> (0.6 <= Norm[#] <= 0.8 && #[[2]] > 0 &),
    "Lower" -> (0.6 <= Norm[#] <= 0.8 && #[[2]] < 0 &)|>;

  configurations["GapOffset"] = <|
    "Upper" -> (0.6 <= Norm[# + {0.1, 0}] <= 0.8 && #[[2]] > 0 &),
    "Lower" -> (0.6 <= Norm[# - {0.1, 0}] <= 0.8 && #[[2]] < 0 &)|>;

  configurations["HighGapNoOffset"] = <|
    "Upper" -> (0.6 <= Norm[# + {0, -0.1}] <= 0.8 && #[[2]] > 0.1 &),
    "Lower" -> (0.6 <= Norm[# - {0, -0.1}] <= 0.8 && #[[2]] < -0.1 &)|>;

  configurations["HighGapOffset"] = <|
    "Upper" -> (0.6 <= Norm[# + {0.1, -0.1}] <= 0.8 && #[[2]] > 0.1 &),
    "Lower" -> (0.6 <= Norm[# - {0.1, -0.1}] <= 0.8 && #[[2]] < -0.1 &)|>;

  configurations["NegativeGapNoOffset"] = <|
    "Upper" -> (0.6 <= Norm[# + {0, 0.1}] <= 0.8 && #[[2]] > -0.1 &),
    "Lower" -> (0.6 <= Norm[# - {0, 0.1}] <= 0.8 && #[[2]] < 0.1 &)|>;

  configurations["NegativeGapOffset"] = <|
    "Upper" -> (0.6 <= Norm[# + {-0.1, 0.1}] <= 0.8 && #[[2]] > -0.1 &),
    "Lower" -> (0.6 <= Norm[# - {-0.1, 0.1}] <= 0.8 && #[[2]] < 0.1 &)|>;

  configurations["NoGapRotation"] = <|
    "Upper" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) > 0) &),
    "Lower" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) < 0) &)|>;

  configurations["GapRotation"] = <|
    "Upper" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) > 0) &),
    "Lower" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) < 0) &)|>;

  configurations["GapRotation"] = <|
    "Upper" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) > 0.1) &),
    "Lower" -> (0.6 <= Norm[#] <= 0.8 && ((0.5 #[[1]] + #[[2]]) < -0.1) &)|>;

  topKeys = Keys@configurations[[ ;; ]];

  Riffle[
    MapThread[
      Module[{allData, upperMoon, lowerMoon, trainedNet,
        preTrainedGraphics, trainedGraphics, combinedGraphics},
        topKeys = Keys[configurations];
        allData = RandomReal[{-1, 1}, {15000, 2}];
        upperMoon = Select[allData, #1];
        lowerMoon = Select[allData, #2];

        preTrainedGraphics =
            Graphics[{PointSize@0.005, Opacity@0.5, Darker@Green,
              Point[upperMoon], {PointSize@0.005, Opacity@0.5, Red,
                Point[lowerMoon]}}, AspectRatio -> 1,
              PlotRange -> {{-1, 1}, {-1, 1}}, ImageSize -> 300,
              PlotLabel -> "TrainingSet"];

        trainedNet =
            NetTrain[NetChain[{LinearLayer[1], LogisticSigmoid}],
              Join @@ {(# -> 1) & /@ upperMoon, (# -> 0) & /@ lowerMoon}];

        trainedGraphics =
            With[{blends = Join @@
                Table[{Blend[{Red, Green}, trainedNet[{x, y}, None][[1]]], PointSize@0.005,
                  Point[{x, y}]},
                  {x, -1, 1, 0.025},
                  {y, -1, 1, 0.025}
                ]
            },
              Graphics[
                {
                {PointSize@0.005, Opacity@0.5, Darker@Green, Point[upperMoon]},
                {PointSize@0.005, Opacity@0.5, Red, Point[lowerMoon]}, blends},
                ImageSize -> 300,
                AspectRatio -> 1,
                PlotRange -> {{-1, 1}, {-1, 1}},
                PlotLabel -> "TrainedNet's ViewOfSpace"]
            ];

        combinedGraphics = Labeled[Framed[GraphicsRow[{preTrainedGraphics, trainedGraphics}]], #3, Top];
        Export[#3 <> ".png", combinedGraphics, ImageSize -> 700, ImageResolution -> 1000]

      ] &
      , {configurations[#]["Upper"] & /@ topKeys, configurations[#]["Lower"] & /@ topKeys, topKeys}
    ], "\n\n"]

] // Column