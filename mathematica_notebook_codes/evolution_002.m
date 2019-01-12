(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-12 *)

Needs["evolution002`"]
ShowIndividuals[
  ind = CreateIndividuals["Number" -> 10, "Organs" -> 40,
    "MaxValue" -> 0.8], 4]


ShowIndividuals[Nest[CreateChildren[#, 10] &, ind, 1], 4]

data = InBreedList[ind, 48];
Grid@Partition[
  Table[Histogram[Flatten@data[[n]], {1 / 200},
    PlotRange -> {{0, .8}, All}], {n, 2, Length[data]}], 8]

ShowIndividuals[InBreed[ind, 000], 4]
ShowIndividuals[InBreed[ind, 099], 4]

Table[ShowIndividuals[InBreed[ind, 099], 4], 3]

(*08/11/2017*)

ShowIndividuals[
  ind = CreateIndividuals["Number" -> 10, "Organs" -> 12], 3]

ShowIndividuals[CreateChildren[ind, 10], 3]

genList = InBreedList[ind, 20, 10];
Table[ShowIndividuals[genList[[n]], 3], {n, 1, Length[genList]}]