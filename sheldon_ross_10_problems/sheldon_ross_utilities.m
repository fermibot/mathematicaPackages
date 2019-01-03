(*Code for renaming directory files*)
RenameFile[#,
   StringReplace[#,
    "sheldon_ross_example_3.28" ->
     "sheldon_ross_10_example_3.028"]] & /@
 FileNames["*png" | "*txt", NotebookDirectory[]]