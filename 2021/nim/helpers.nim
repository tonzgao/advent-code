import sugar
import std/strutils
import std/strformat
import std/parseutils
import std/sequtils

proc data*[T](day: uint, parser: (string) -> T = proc (x: string): string = x): seq[T] =
  result = readFile(fmt"../data/day{day}.txt").split("\n").map(parser)

func sum*(input: seq[int]): int =
  return foldl(input, a+b)

func bin2int*(input: seq[int]): int =
  return fromBin[int](join(input))

export 
  sugar, parseInt
