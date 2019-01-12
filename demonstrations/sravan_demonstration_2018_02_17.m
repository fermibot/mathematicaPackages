ClearAll[tF, type];
tF[] := RandomChoice[{True, False}];
type[] := RandomChoice[{"IP", "Domain", "Hash", "URL"}];

ioc["IP"] :=
    ToString[RandomInteger[{100, 116}]] <> "." <>
        ToString[RandomInteger[{100, 116}]] <> "." <>
        ToString[RandomInteger[{100, 116}]] <> "." <>
        ToString[RandomInteger[{100, 116}]]
ioc["Domain"] := "http://" <> RandomWord[] <> ".com";
ioc["Hash"] :=
    StringJoin @@
        RandomChoice[
          Join @@ {ToUpperCase /@ Alphabet[],
            ToString /@ Table[n, {n, 0, 9}]}, 12];
ioc["URL"] := "http://" <> RandomWord[];

group[] :=
    StringJoin @@
        RandomChoice[
          Join @@ {ToUpperCase /@ Alphabet[],
            ToString /@ Table[n, {n, 0, 9}]}, RandomInteger[{4, 12}]]

Table[Export[
  "daily_report_" <> StringPadLeft[ToString[r], 3, "0"] <> ".xls",
  Join @@ {{{"Block", "Monitor", "Type", "IOC", "Group"}},
    Table[Module[{typ = type[]}, {tF[], tF[], typ, ioc[typ],
      group[]}], {n, 50}]}], {r, 1, 1}]

ioc["IP"] :=
    ToString[RandomInteger[{100, 115}]] <> "." <>
        ToString[RandomInteger[{100, 115}]] <> "." <>
        ToString[RandomInteger[{100, 115}]] <> "." <>
        ToString[RandomInteger[{100, 115}]]
Export["report_database.xls",
  Join @@ {{{"Block", "Monitor", "Type", "IOC", "Group"}},
    Table[Module[{typ = type[]}, {tF[], tF[], typ, ioc[typ],
      group[]}], {n, 6000}]}]

SetOptions[SelectedNotebook[], PrintingStyleEnvironment -> "Printout",
  ShowSyntaxStyles -> True]