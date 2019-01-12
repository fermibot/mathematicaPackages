(* Mathematica Source File  *)
(* Created by Mathematica Plugin for IntelliJ IDEA *)
(* :Author: Alcatraz *)
(* :Date: 2019-01-11 *)

Quiet@DeleteFile["test.txt"];
Quiet@DeleteFile["test.html"];
Quiet@Close["test.txt"];
f = OpenWrite["test.txt"];
WriteString[f,
  "<!DOCTYPE HTML>
   <html>
   	<head>
   	</head>
   	<body>
   		<h2>Click the links to open the images</h2>" <>
      "\n\t\t\t<ul style=\"list-style: none;\">" <>
      Table["\n\t\t\t\t<li><a href=\"" <> ToString[n] <> ".gif" <>
          "\"target=\"_blank\">" <> "Image" <> "</a></li>", {n, 1, 10}] <>
      "\n\t\t\t</ul>" <>
      "\n</body>
   </html>"];
Close["test.txt"];
RenameFile["test.txt", "test.html"];

Table[Export[ToString[n] <> ".gif", Graphics[Circle[]]], {n, 1, 10}]