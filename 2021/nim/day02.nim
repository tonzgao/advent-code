import std/strutils

import ./helpers

func parser(x: string): (string, int) = 
  let splitstring = x.split(" ")
  (splitstring[0], parseInt(splitstring[1]))

let input = data(2, parser)

type Result = object
  depth, length, aim: int

proc day2(): Result =
  var
    depth = 0
    length = 0
    aim = 0
  for (dir, amount) in input:
    case dir:
    of "forward":
      length += amount
      depth += amount * aim
    of "down":
      aim += amount
    of "up":
      aim -= amount
  return Result(depth: depth, length: length, aim: aim)

let result = day2()

echo result.length * result.aim
echo result.length * result.depth