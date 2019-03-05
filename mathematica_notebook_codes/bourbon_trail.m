(* :Title: bourbon_trail *)
(* :Context: bourbon_trail` *)
(* :Author: Fermibot *)
(* :Date: 2019-03-04 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2019 Fermibot *)
(* :Keywords: *)
(* :Discussion: *)


Module[
  {bourbon = <|
    1 -> {"Angel's Envy", GeoPosition[{38.25523, -85.74384}]},
    2 -> {"Bulleit Frontier Whiskey",
      GeoPosition[{38.207406, -85.8076951}]},
    3 -> {"Evan Williams Experience",
      GeoPosition[{38.2567, -85.7595}]},
    4 -> {"Four Roses Distillery",
      GeoPosition[{37.9731697, -84.8981012}]},
    5 -> {"Heaven Hills Distilleries",
      GeoPosition[{37.7947, -85.4641000}]},
    6 -> {"Jim Beam Distillery", GeoPosition[{37.935164, -85.656559}]},
    7 -> {"Maker's Mark Distillery",
      GeoPosition[{37.6475, -85.34980000000002}]},
    8 -> {"Town Branch Distillery",
      GeoPosition[{38.049455, -84.5092307}]},
    9 -> {"Wild Turkey Distillery",
      GeoPosition[{38.0430886, -84.8633343}]},
    10 -> {"Woodford Reserve Distillery",
      GeoPosition[{38.1129399, -84.8105524}]}
  |>,
    coordinates, labels
  },
  coordinates = #[[2]] & /@ Values[bourbon];
  labels = #[[1]] & /@ Values[bourbon];
  GeoGraphics[{DeleteCases[
    Table[If[start > destination,
      GeoPath[{bourbon[start][[2]], bourbon[destination][[2]]}],
      Null], {start, Keys@bourbon}, {destination, Keys@bourbon}],
    Null], GeoMarker[bourbon[#][[2]]] & /@ Keys@bourbon},
    ImageSize -> 1200, GeoBackground -> "Satellite"];

  Framed@TableForm[
    ParallelTable[
      TravelDistance[{start, destination}], {start,
      coordinates}, {destination, coordinates}],
    TableHeadings -> {labels,
      Rotate[#, Divide[2 \[Pi], 5]] & /@ labels}]
]