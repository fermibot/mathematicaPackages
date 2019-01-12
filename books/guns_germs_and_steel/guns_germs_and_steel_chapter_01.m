(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

ClearAll[dO]
dO[x__, label_ : ""] := Labeled[DateObject[{x}], label];
dO[x1__List, x2__List, label_] :=
    Labeled[Interval[{DateObject[x1], DateObject[x2]}], label]

TimelinePlot[{#} & /@ {
  dO[-4000000, "Upright Posture"],
  dO[-2500000, "\[UpArrow] Brain and Body Size"],
  dO[-500000, "Rounder and less angular skulls"],
  dO[-500000, "Homo Sapiens with smaller brians"],
  dO[{-130000}, {-40000}, "Homo neanderthalensis \n(larger brains then our own)"],
  dO[-40000, "Emergence of Cold \nCoping Technology"],
  dO[-45000, "Standardized stone tools"],
  dO[{-35000}, {-14000}, "Colonization of Americas?"],
  dO[-20000, "Colonization of Siberia"],
  dO[-14000, "Land bridge flooded \nbecoming a strait"],
  dO[-12000, "Earliest evidence of \nAlaskans"],
  dO[{-12000}, {-10000}, "Alaskans reached \nEdmonton (Canada)"],
  dO[-30000, "Extinction of large \nmammals in Australia"],
  dO[{-17000}, {-12000}, Style["Large mammals' \nextinction in Americas : Clovis \nhunters or Climate?", Red]],
  dO[-11000, Style["Point estimate of large mammals \nextinction in Americas", Red]],
  dO[-11100, Style["Arrival of Clovis Hunters \nGrand Canyon", Red]]
}, Filling -> Bottom, ImageSize -> 850]