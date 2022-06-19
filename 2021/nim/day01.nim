import ./helpers

let input = data[int](1, parseInt)

proc day1(maxiter: int = input.high, getter: (int) -> int = proc(i: int): int = input[i]): int =
  var 
    count = 0
    current = input[0]
  for i in 1..maxiter:
    let item = getter(i)
    if item > current:
      count += 1
    current = item
  return count

echo day1()
echo day1(input.high - 2, proc(i: int): int = sum(input[i..(i+2)]))