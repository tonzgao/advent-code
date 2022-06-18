import ./helpers/data

let input = data[int](1, parseInt)

proc day1(maxiter: int, getter: (int) -> int): int =
  var 
    count = 0
    current = input[0]
  for i in 1..maxiter:
    let item = getter(i)
    if item > current:
      count += 1
    current = item
  return count


proc getter(i: int): int = input[i]
echo day1(input.high, getter)


proc win3(i: int): int =
  return sum(input[i..(i+2)])
echo day1(input.high - 2, win3)