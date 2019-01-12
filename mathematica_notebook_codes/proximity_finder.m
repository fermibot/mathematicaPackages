(* :Title: proximity_finder *)
(* :Context: proximity_finder` *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

proximityFinder[np_Integer, list_List] := Module[{npts, pts, proxp},
  If[np <= Length[list], npts = np, npts = Length[list]];
  pts = RandomSample[list, npts]; proxp = {};
  Table[If[(Norm[{{0, 0}, list[[n]]}] <
      0.5) || (Norm[{{0, 0}, list[[n]]}] > .95),
    proxp = Join[proxp, {list[[n]]}]], {n, 1, Length[list]}];
  Graphics[{{Opacity[0.2], Green, PointSize[0.001],
    Point[proxp]}, {Opacity[1], Red, PointSize[0.01],
    Point[{0, 0}]}}, AspectRatio -> 1, ImageSize -> 600,
    PlotRange -> {{-1, 1}, {-1, 1}}]]
proximityFinder[1, RandomReal[{-1, 1}, {150000, 2}]]

proximityFinder[np_Integer, list_List, lines_ : True] :=
    Module[{npts, pts, proxp, ptsch},
      If[np <= Length[list], npts = np, npts = Length[list]];
      pts = RandomSample[list, npts]; proxp = {}; ptsch = pts[[1]];
      Table[If[EuclideanDistance[pts[[r]], list[[n]]] < .1,
        proxp = Union[proxp, {list[[n]]}]], {n, 1, Length[list]}, {r, 1,
        Length[pts]}];
      Graphics[{{Blue, PointSize[0.001], Point[proxp]}, {Opacity[1], Blue,
        PointSize[0.01], Point[pts]}, {Lighter[Green],
        Line[pts[[Last[FindShortestTour[pts]]]]]}}, AspectRatio -> 1,
        ImageSize -> 600, PlotRange -> {{-1, 1}, {-1, 1}}]]
proximityFinder[60, RandomReal[{-1, 1}, {10000, 2}]]