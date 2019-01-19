Module[
  {
    mirnew = "C:\\Users\\Alcatraz\\Downloads\\Mir Books (New)-20190106T230049Z-001\\Mir Books (New)",
    mirold = "C:\\Users\\Alcatraz\\Downloads\\Mir Books-20190106T230531Z-001\\Mir Books",
    mirmir = "D:\\Mir Books"
  },
  mirnew = StringDrop[StringDelete[#, mirnew], 1] & /@ FileNames["*", mirnew];
  mirold = StringDrop[StringDelete[#, mirold], 1] & /@ FileNames["*", mirold];
  mirmir = StringDrop[StringDelete[#, mirmir], 1] & /@ FileNames["*", mirmir];

  Grid[#, Frame -> All, Alignment -> Left] &
  [
    MapThread[{#2} ~
        Join ~ (If[StringQ[#], Style[#, Lighter@Blue],
      If[#, Style[#, Green], Style[#, Red]]] & /@ #1) &, {({#,
      MemberQ[mirmir, #], MemberQ[mirnew, #],
      MemberQ[mirold, #]} & /@ mirmir), Range@Length@mirmir}]]
]



Needs["DatabaseLink`"]
Module[{db =
    OpenSQLConnection[
      JDBC["SQLite",
        "D:\\Programming\\python\\PyCharm\\mathematicaPython\\\
Collections.db"]], dbAuthors, authors, names},
  dbAuthors = SQLExecute[db, "SELECT * FROM main.authors"];
  authors =
      Rest@Rest@StringSplit[StringDelete[#, ".pdf" | ".djvu"], " - "] & /@
          FileNames["Science for*" | "Science For*", "D:\\Mir Books"] //
          Union @@ # &;
  names = (If[
    StringContainsQ[#, "."],
    Module[{position =
        Last[StringPosition[#, "."]][[2]]}, {StringTake[#, position],
      StringDrop[#, position]}],
    StringSplit[#, " "]] & /@ authors);
  MapThread[{#1} ~ Join ~ #2 &, {authors, names}];

  dbAuthors = #[[2]] <> #[[3]] & /@ dbAuthors;

  Export[StringReplace[NotebookFileName[], ".nb" -> ".xlsx"], names]

]