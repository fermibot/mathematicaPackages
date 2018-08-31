ClearAll[status, currentStatus];
status[list_List, time_] := Or @@ (Min[#] < time <= Max[#] & /@ list)
currentStatus[list_List, time_] :=
    Min[#] < time <= Max[#] &[Last[list]]
status[#, 10] & /@ ConstantArray[0, {10, 2, 2}]
currentStatus[#, 10] & /@ ConstantArray[0, {10, 2, 2}]


Module[{servers = 10, serverStatus, nCustomers = 1000,
  arrivals, \[Lambda]a = 5, \[Lambda]s = 15},
  arrivals =
      Accumulate[
        RandomVariate[ExponentialDistribution[\[Lambda]a], nCustomers]];
]