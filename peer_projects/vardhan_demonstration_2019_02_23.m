(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Fermibot *)
(* :Date: 2019-02-23 *)


If[! MemberQ[$Path, "D:\\Programming\\mathematicaPackages"],
  AppendTo[$Path, "D:\\Programming\\mathematicaPackages"]];
$Path = Union[$Path];
Needs["bookOrganizer`"]

Module[{bookPath, books},
  bookPath = "D:\\Books\\Motion Mountain\\";
  books = FileNames["*", bookPath];
  bookRename[books]
]

