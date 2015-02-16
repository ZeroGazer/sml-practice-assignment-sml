COMP3031 Assignment 1
=====================

HKUST COMP3031 Principles of Programming Languages (2013 Fall) Assignment 1

=====================

Question 1. Triangular Numbers

A triangular number is the sum of n consecutive natural numbers from <i>1</i> to <i>n</i>, <i>n=1,2,3</i>...

Formally, the <i>n<sup>th</sup><i> triangular number is defined by the equation:

<code><i>1+2+3+...+n=n*(n+1)/2</i></code>

Write a function named <i>isTriangular</i> to determine whether a given positive integer is a triangular number.

<code>val isTriangular = fn : int -> bool</code>

Examples:

```
- isTriangular(6);

val it = true : bool

- isTriangular(7);

val it = false : bool
```

=====================

Question 2. Merging Two Lists

Write a function <i>merge</i> that returns a list of <b>distinct</b> elements from both of the input lists, i.e., if an element appears in one or both of the input lists, this element will appear exactly once in the returned list. The order of the elements in the returned list does not matter.

<code>val merge = fn : ''a list -> ''a list -> ''a list</code>

Note: ''a stands for a polymorphic type that supports equality test. 

Examples:

```
- merge [1,2,3,4,5] [4,5,6,7,8];

val it = [1,2,3,4,5,6,7,8] : int list

- merge ["a", "a"] nil; 

val it = ["a"] : string list
```

=====================

Question 3. Splitting a List

Write a function, <i>split</i>, that splits a list into a tuple of two lists based on a Boolean function. The first component of the tuple is the list consisting of all elements in the input list that satisfy the Boolean function; and the second component of the tuple is the list consisting of all elements in the input list that do not satisfy the Boolean function. Order does not matter in either of the output lists. 

<code>val split = fn : ('a -> bool) -> 'a list -> 'a list * 'a list</code>

Examples: 

```
- fun positive x = x>0.0;

val positive = fn : real -> bool 

- split positive [0.1, ~2.3, 4e5, ~67.89];

val it = ([400000.0,0.1],[~67.89,~2.3]) : real list * real list 
```

=====================

Question 4. Cumulative Moving Average

The cumulative moving average <i>CA<sub>i+1</sub></i> of <i>i+1</i> <i>(i?0)</i> numbers <i>x<sub>1</sub>,..., x<sub>i+1</sub></i> is defined as follows:

<code><i>CA<sub>i+1</sub> = x<sub>i+1</sub>+i*CA<sub>i</sub>/(i+1), CA<sub>i</sub>=x<sub>i</sub></i></code>

Write a function avg taking parameter <i>(x<sub>i+1</sub>, CA<sub>i</sub>, i)</i> to calculate <i>CA<sub>i+1</sub></i> on real numbers, and a function <i>cma</i> that can use <i>avg</i> to calculate the cumulative moving average of a non-empty list of real numbers. Note: <i>cma</i> can work on other types of lists.

<code>val avg = fn : real * real * int -> real</code>

<code>val cma = fn : ('a * 'a * int -> 'a) -> 'a list -> 'a</code>

Examples:

```
- avg (2.0, 1.0, 1);

val it = 1.5 : real

- avg (3.0, 1.5, 2);

val it = 2.0 : real

- avg (4.0, 2.0, 3);

val it = 2.5 : real

- cma avg [1.0];

val it = 1.0 : real

- cma avg [1.0,2.0];

val it = 1.5 : real

- cma avg [1.0, 2.0, 3.0];

val it = 2.0 : real

- cma avg [1.0,2.0,3.0,4.0];

val it = 2.5 : real
```

=====================

Question 5. Polygonal Numbers

A polygonal number is the number of dots that can form an equilateral polygonal area. Formally, the <i>m<sup>th</sup></i> polygonal number of an n-side polygon is defined as follows:

<code><i>p(m, n) = m*(n-2)*(m-1)/2+m</i></code>

a) Define a new data type <i>polygonalNum</i> with four constructors: <i>pentagonalNum</i> of <i>int</i>, <i>hexagonalNum</i> of <i>int</i>, <i>heptagonalNum</i> of <i>int</i>, and <i>octagonalNum</i> of <i>int</i>. The parameter <i>m</i> of each constructor means the polygonal number is the <i>m<sup>th</sup></i> one

b) Write a function <i>polygonalValue</i> to return the value of a <i>polygonalNum</i>:

<code>val polygonalValue = fn : polygonalNum -> int</code>

Examples:

```
- polygonalValue(heptagonalNum(5));

val it = 55 : int

- polygonalValue(octagonalNum(3));

val it = 21 : int
```

c) Write a function <i>coveringPolygon</i> that takes a positive integer <i>x</i> as input and returns a <i>polygonalNum</i> whose value is the least that is greater than or equal to <i>x</i>. If two <i>polygonalNums</i> have the same value, return the one that has more sides.

<code>val coveringPolygon = fn : int -> polygonalNum</code>

Examples:

```
- coveringPolygon(1);

val it = octagonalNum 1 : polygonalNum

- coveringPolygon(23);

val it = hexagonalNum 4 : polygonalNum
```
