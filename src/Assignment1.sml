exception Invalid;

(* Problem 1 *)
fun isTriangular x =
  let
    val y = 0.5 * (Math.sqrt (1.0 + 8.0 * real (x)) - 1.0)
  in
    if floor (y) = ceil (y) then
      true
    else
      false
  end;

(* Problem 2 *)
fun checkDuplicated e [] = false
  | checkDuplicated e h::t = 
    if h = e then
      true
    else
      checkDuplicated(e, t);

fun merge L1 L2 = 
  let
    fun merge2([], [], L3) = L3
      | merge2([], h::t, L3) =
        if checkDuplicated(h, L3) then
          merge2([], t, L3)
        else
          merge2([], t, h::L3)
      | merge2(h::t, L2, L3) =
        if checkDuplicated(h, L3) then
          merge2(t, L2, L3)
        else
          merge2(t, L2, h::L3);
  in
    merge2(L1, L2, [])
  end;

(* Problem 3 *)
fun split f x =
  let 
    fun split2 f ([], L1, L2) = (L1, L2)
      | split2 f (h::t, L1, L2) =
        if(f(h)) then
          split2 f (t, h::L1, L2)
        else
          split2 f (t, L1, h::L2);
  in
    split2 f(x, [], [])
  end;

(* Problem 4 *)
fun avg (x: real, CA: real, i) = (CA * real(i) + x) / (real(i) + 1.0);

fun cma f [] = raise Invalid
  | cma f (h::t) = 
    let
      fun cma2 f2 ([], CA, i) = CA
        | cma2 f2 (h::t, CA, i) = cma2 f (t, f(h, CA, i), i + 1);
    in
      cma2 f (t, h, 1)
    end;

(* Problem 5a *)
datatype polygonalNum =
  pentagonalNum of int 
| hexagonalNum of int
| heptagonalNum of int
| octagonalNum of int;

(* Problem 5b *)
fun polygonalValue(pentagonalNum(m)) = m * 3 * (m-1) div 2 + m
  | polygonalValue(hexagonalNum(m)) = m * 4 * (m-1) div 2 + m
  | polygonalValue(heptagonalNum(m)) = m * 5 * (m-1) div 2 + m
  | polygonalValue(octagonalNum(m)) = m * 6 * (m-1) div 2 + m;

(* Problem 5c *)
fun coveringPolygon x = 
  if x < 0 then
    raise Invalid
  else
    let
      fun covering(x, polygon, pentagonalNum(m)) = 
          if polygonalValue(pentagonalNum(m)) < x then
            covering(x, polygon, pentagonalNum(m+1))
          else
            covering(x, pentagonalNum(m), hexagonalNum(0))
        | covering(x, polygon, hexagonalNum(m)) =
          if polygonalValue(hexagonalNum(m)) < x then
            covering(x, polygon, hexagonalNum(m+1))
          else 
            if polygonalValue(hexagonalNum(m)) <= polygonalValue(polygon) then
              covering(x, hexagonalNum(m), heptagonalNum(0))
            else
              covering(x, polygon, heptagonalNum(0))
        | covering(x, polygon, heptagonalNum(m)) =
          if polygonalValue(heptagonalNum(m)) < x then
            covering(x, polygon, heptagonalNum(m+1))
          else
            if polygonalValue(heptagonalNum(m)) <= polygonalValue(polygon) then
              covering(x, heptagonalNum(m), octagonalNum(0))
            else
              covering(x, polygon, octagonalNum(0))
        | covering(x, polygon, octagonalNum(m)) =
          if polygonalValue(octagonalNum(m)) < x then
            covering(x, polygon, octagonalNum(m+1))
          else
            if polygonalValue(octagonalNum(m)) <= polygonalValue(polygon) then
              octagonalNum(m)
            else
              polygon;
    in
      covering(x, pentagonalNum(0), pentagonalNum(0))
    end;
