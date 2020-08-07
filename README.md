Array bisection algorithm for the [V language](https://vlang.io).

# Installation

```
v install mobarski.bisect
```

# Usage

All the following functions return the insertion index that maintains sorted order of the array.
They differ in the way they handle identical values:
- `bisect.left<T>(a []T, x T) int` - return index to the left in case of equal value
- `bisect.right<T>(a []T, x T) int` - return index to the right in case of equal value
- `bisect.first_available<T>(a []T, x T) int` - return first available index (fastest)

# Examples

Simple example:
```v
import mobarski.bisect

mut a := []int{}
for x in [4,5,1,9,7,8,3,2,6] {
    i := bisect.left<int>(a, x)
    a.insert(i, x)
}
println(a) // [1,2,3,4,5,6,7,8,9]
```

Detailed example:
```v
import mobarski.bisect

// index: 0  1 2 3 4
a := [int(2),2,2,4,6]

println(bisect.left<int>(a, 1))            // 0
println(bisect.right<int>(a, 1))           // 0
println(bisect.first_available<int>(a, 1)) // 0

println(bisect.left<int>(a, 2))            // 0
println(bisect.right<int>(a, 2))           // 3
println(bisect.first_available<int>(a, 2)) // anything from 0 to 3

println(bisect.left<int>(a, 3))            // 3
println(bisect.right<int>(a, 3))           // 3
println(bisect.first_available<int>(a, 3)) // 3

println(bisect.left<int>(a, 4))            // 3
println(bisect.right<int>(a, 4))           // 4
println(bisect.first_available<int>(a, 4)) // 3 or 4

println(bisect.left<int>(a, 8))            // 5
println(bisect.right<int>(a, 8))           // 5
println(bisect.first_available<int>(a, 8)) // 5

```
