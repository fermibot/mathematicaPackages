(* Mathematica Package *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)

(* :Title: bookOrganizer *)
(* :Context: bookOrganizer` *)
(* :Author: Fermibot *)
(* :Date: 2019-02-23 *)

(* :Package Version: 0.1 *)
(* :Mathematica Version: *)
(* :Copyright: (c) 2019 Fermibot *)
(* :Keywords: *)
(* :Discussion: *)

BeginPackage["bookOrganizer`"];
(* Exported symbols added here with SymbolName::usage *)
stringContainsMountainQ::usage = "This determines if the input string contains the phrase 'motionmountain' or not";
volumeNumberExtract::usage = "Looks at a book's name as a string and extracts the maximum integer number form it.";
bookRename::usage = "This is a general function that looks at the name of the file and determines if nt needs standardization";

Begin["`Private`"];

Needs["utilities`"];


stringContainsMountainQ[string_?StringQ] :=
    StringContainsQ[string, "motionmountain"];


volumeNumberExtract[bookNameIn_?StringQ] :=
    Module[
      {bookName = bookNameIn, i, j, stringParts = List[]},
      bookName = bookNameIn;
      For[j = 0, j <= 1, j++,
        For[i = 1, i < StringLength[bookName] - j + 1, i++,
          AppendTo[stringParts, StringTake[bookName, {i, i + j}]]
        ]
      ];
      stringParts = DeleteCases[
        Module[{expression = Quiet@ToExpression@#}, If[NumberQ@expression, expression, Null]] & /@ stringParts, Null];
      Last@stringParts
    ];

bookRename[bookNamesIn_?ListQ] := bookRename /@ bookNamesIn;

bookRename[bookNameIn_?stringContainsMountainQ] :=
    Module[
      {authorName = "Christoph Schiller",
        bookName = "Motion Mountain",
        directory, extension,
        volumeNumber},
      directory = Drop[StringSplit[bookNameIn, "\\"], -1];
      Print@directory;
      Print@extension;
      Abort[];
      volumeNumber = ToString@volumeNumberExtract[bookNameIn];
      StringJoin @@ {bookName, " ", volumeNumber, " - ", authorName}
    ];

bookRename[bookName_?NumberQ] := Null;

End[]; (* `Private` *)

EndPackage[]