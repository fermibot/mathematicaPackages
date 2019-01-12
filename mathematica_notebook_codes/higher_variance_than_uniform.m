highVar[degree_?EvenQ] :=
    Module[{d = degree, multiplier},
      multiplier =
          Integrate[
            Power[x - 0.5, d], {x, 0,
            1}]; (Divide[1, multiplier] Integrate[
        Power[x - 0.5, d] Power[x, 2], {x, 0, 1}]) -
          Power[Divide[1, multiplier] Integrate[
            Power[x - 0.5, d] x, {x, 0, 1}], 2]]
highVar[10]