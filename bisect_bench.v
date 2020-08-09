import math
import mobarski.bisect
import mobarski.bench

// ---[ INPUT ]----------------------------------------------------------------

fn new_linear_array(size int) []int {
	mut a := []int{len:size}
	for i in 0..size {
		a[i] = i*2
	}
	return a
}

fn new_log_array(size int) []int {
	mut a := []int{len:size}
	for i in 0..size {
		a[i] = int(100*math.log(1+i))*2
	}
	return a
}

// ---[ BENCH ]----------------------------------------------------------------

// TODO function pointer

fn bench_first(label string, data []int, runs int) {
	size := data.len
	max_val := data[data.len-1]
	mut b := bench.new("$label size=$size n_ops=${max_val} runs=$runs ")
	for _ in 0..runs {
		for i in 0..max_val {
			bisect.first_available<int>(data, i)
		}
		b.step()
	}
	b.print(max_val)
}

fn bench_left(label string, data []int, runs int) {
	size := data.len
	max_val := data[data.len-1]
	mut b := bench.new("$label size=$size n_ops=${max_val} runs=$runs ")
	for _ in 0..runs {
		for i in 0..max_val {
			bisect.left<int>(data, i)
		}
		b.step()
	}
	b.print(max_val)
}

fn bench_right(label string, data []int, runs int) {
	size := data.len
	max_val := data[data.len-1]
	mut b := bench.new("$label size=$size n_ops=${max_val} runs=$runs ")
	for _ in 0..runs {
		for i in 0..max_val {
			bisect.right<int>(data, i)
		}
		b.step()
	}
	b.print(max_val)
}

// ---[ MAIN ]-----------------------------------------------------------------

a1_1m := new_linear_array(1_000_000) // XXX
a1_1k := new_linear_array(1_000)

a2_1m := new_log_array(1_000_000) // XXX
a2_1k := new_log_array(1_000)

bench_first("bisect.first_available<int> linear", a1_1m, 15)
bench_left("bisect.left<int> linear", a1_1m, 15)
bench_right("bisect.right<int> linear", a1_1m, 15)

bench_first("bisect.first_available<int> linear", a1_1k, 15)
bench_left("bisect.left<int> linear", a1_1k, 15)
bench_right("bisect.right<int> linear", a1_1k, 15)

bench_first("bisect.first_available<int> log", a2_1m, 15)
bench_left("bisect.left<int> log", a2_1m, 15)
bench_right("bisect.right<int> log", a2_1m, 15)

bench_first("bisect.first_available<int> log", a2_1k, 15)
bench_left("bisect.left<int> log", a2_1k, 15)
bench_right("bisect.right<int> log", a2_1k, 15)

