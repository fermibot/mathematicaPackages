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