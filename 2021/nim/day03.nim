import algorithm, arraymancer, elvis, sequtils, strutils

import ./helpers


let tensorfy = proc (x: string): Tensor[int] = toSeq(x).map(c => int(c) - 48).toTensor()
var input = sorted(data[string](3)).map(x => tensorfy(x))

proc day3(): int =
  var 
    length = input.high
    sums = input[0].toSeq().toTensor()
  for i in input[1..length]:
    sums += i
  
  let gamma = collect(newSeq, (for i in sums: ((length - i > i) ? 0 ! 1)))
  let epislon = collect(newSeq, (for i in gamma: `xor`(i, 1)))
  return bin2int(gamma) * bin2int(epislon)

echo day3()

proc find_boundary(bot: int, top: int, index: int): int =
  for i, v in input[bot..top]:
    if v[index] == 1:
      return bot + i
  return bot

proc scrubber(lcd: bool): seq[int] = 
  let length = input[0].size() - 1
  var
    bot = 0
    top = input.high
  
  for target in 0..length:
    let index = bot + int((top - bot + 1) / 2)
    let item = input[index][target]

    if lcd and item == 0:
      bot = find_boundary(index, top, target)
    elif lcd and item == 1:
      top = find_boundary(bot, index, target) - 1
    elif item == 0:
      top = find_boundary(index, top, target) - 1
    else:
      bot = find_boundary(bot, index, target)

    if bot == top:
      break

  return toSeq(input[bot])

proc day3_2(): int =
  var 
    oxygen = scrubber(false)
    c02 = scrubber(true)
  return bin2int(oxygen) * bin2int(c02)

echo day3_2()