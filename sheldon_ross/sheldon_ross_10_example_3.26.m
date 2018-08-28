With[{range = 1000},
  BarChart[KeySort@
      Counts[Count[#, True] & /@
          Table[MapThread[#1 == #2 &, {Range[range],
            RandomSample[Range[range]]}], 10000]]]]