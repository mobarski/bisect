import bisect

// bisect

fn test_bisect_int_between() {
	a := [2,4,6]
	assert bisect.first_available<int>(a,0) == 0
	assert bisect.first_available<int>(a,1) == 0
	assert bisect.first_available<int>(a,3) == 1
	assert bisect.first_available<int>(a,5) == 2
	assert bisect.first_available<int>(a,7) == 3
}

fn test_bisect_int_same() {
	a := [1,1,1,1,1,1]
	assert bisect.first_available<int>(a,1) == 3
}

fn test_bisect_int_empty() {
	a := []int{}
	assert bisect.first_available<int>(a,0) == 0
	assert bisect.first_available<int>(a,1) == 0
	assert bisect.first_available<int>(a,2) == 0
}

// bisect.left

fn test_bisect_left_int_between() {
	a := [2,4,6]
	assert bisect.left<int>(a,0) == 0
	assert bisect.left<int>(a,1) == 0
	assert bisect.left<int>(a,2) == 0
	assert bisect.left<int>(a,3) == 1
	assert bisect.left<int>(a,4) == 1
	assert bisect.left<int>(a,5) == 2
	assert bisect.left<int>(a,6) == 2
	assert bisect.left<int>(a,7) == 3
}

fn test_bisect_left_int_same() {
	a := [1,1,1,1,1,1]
	assert bisect.left<int>(a,1) == 0
}

fn test_bisect_left_int_empty() {
	a := []int{}
	assert bisect.left<int>(a,0) == 0
	assert bisect.left<int>(a,1) == 0
	assert bisect.left<int>(a,2) == 0
}

// bisect.right

fn test_bisect_right_int_between() {
	a := [2,4,6]
	assert bisect.right<int>(a,0) == 0
	assert bisect.right<int>(a,1) == 0
	assert bisect.right<int>(a,2) == 1
	assert bisect.right<int>(a,3) == 1
	assert bisect.right<int>(a,4) == 2
	assert bisect.right<int>(a,5) == 2
	assert bisect.right<int>(a,6) == 3
	assert bisect.right<int>(a,7) == 3
}

fn test_bisect_right_int_same() {
	a := [1,1,1,1,1,1]
	assert bisect.right<int>(a,1) == 6
}

fn test_bisect_right_int_empty() {
	a := []int{}
	assert bisect.right<int>(a,0) == 0
	assert bisect.right<int>(a,1) == 0
	assert bisect.right<int>(a,2) == 0
}

// multiple

fn test_22246() {
	// index: 0  1 2 3 4
	a := [int(2),2,2,4,6]

	assert bisect.left<int>(a, 1)  == 0
	assert bisect.right<int>(a, 1) == 0
	assert bisect.first_available<int>(a, 1) == 0

	assert bisect.left<int>(a, 2)  == 0 
	assert bisect.right<int>(a, 2) == 3
	assert bisect.first_available<int>(a, 2) in [0,1,2,3]

	assert bisect.left<int>(a, 3)  == 3
	assert bisect.right<int>(a, 3) == 3
	assert bisect.first_available<int>(a, 3) == 3

	assert bisect.left<int>(a, 4) == 3
	assert bisect.right<int>(a, 4) == 4
	assert bisect.first_available<int>(a, 4) in [3,4]

	assert bisect.left<int>(a, 8)  == 5
	assert bisect.right<int>(a, 8) == 5
	assert bisect.first_available<int>(a, 8) == 5
}

fn test_bisect_left_insert() {
	mut a := []int{}
	for x in [4,5,1,9,7,8,3,2,6] {
		i := bisect.left<int>(a, x)
		a.insert(i, x)
	}
	assert a == [1,2,3,4,5,6,7,8,9]
}

fn test_bisect_right_insert() {
	mut a := []int{}
	for x in [4,5,1,9,7,8,3,2,6] {
		i := bisect.right<int>(a, x)
		a.insert(i, x)
	}
	assert a == [1,2,3,4,5,6,7,8,9]
}

fn test_bisect_first_insert() {
	mut a := []int{}
	for x in [4,5,1,9,7,8,3,2,6] {
		i := bisect.first_available<int>(a, x)
		a.insert(i, x)
	}
	assert a == [1,2,3,4,5,6,7,8,9]
}
