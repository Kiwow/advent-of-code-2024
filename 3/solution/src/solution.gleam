import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

fn before_parentheses_end(str: String) -> Result(String, Nil) {
  str
  |> string.split(on: ")")
  |> list.first
}

fn parse_pair(str: String) -> Result(#(Int, Int), Nil) {
  case str |> string.split(on: ",") {
    [first, second] ->
      case int.parse(first), int.parse(second) {
        Ok(first), Ok(second) -> Ok(#(first, second))
        _, _ -> Error(Nil)
      }
    _ -> Error(Nil)
  }
}

pub fn part_one(input: String) -> Int {
  input
  |> string.split("mul(")
  |> list.map(before_parentheses_end)
  |> list.map(fn(str) { result.try(str, parse_pair) })
  |> result.values
  |> list.map(fn(pair) { pair.0 * pair.1 })
  |> list.fold(0, int.add)
}

type Token {
  Do
  Dont
  Multiply(Int, Int)
}

fn parse_tokens(input: String) -> List(Token) {
  case input {
    "do()" <> rest -> [Do, ..parse_tokens(rest)]
    "don't()" <> rest -> [Dont, ..parse_tokens(rest)]
    "mul(" <> rest -> {
      let maybe_pair = rest |> before_parentheses_end |> result.try(parse_pair)
      case maybe_pair {
        Ok(#(a, b)) -> [Multiply(a, b), ..parse_tokens(rest)]
        Error(_) -> parse_tokens(rest)
      }
    }
    "" -> []
    _ -> parse_tokens(string.drop_start(input, up_to: 1))
  }
}

type MaybeMultiplyAccumulator {
  Accumulator(sum: Int, keep_multiplying: Bool)
}

fn maybe_multiply(
  acc: MaybeMultiplyAccumulator,
  token: Token,
) -> MaybeMultiplyAccumulator {
  case token {
    Do -> Accumulator(acc.sum, True)
    Dont -> Accumulator(acc.sum, False)
    Multiply(a, b) ->
      case acc.keep_multiplying {
        True -> Accumulator(acc.sum + a * b, acc.keep_multiplying)
        False -> acc
      }
  }
}

pub fn part_two(input: String) -> Int {
  input
  |> parse_tokens
  |> list.fold(Accumulator(sum: 0, keep_multiplying: True), maybe_multiply)
  |> fn(acc) { acc.sum }
}

pub fn main() {
  let assert Ok(input) = simplifile.read("../input.txt")
  let part_one = part_one(input)
  let part_two = part_two(input)

  io.println("Part 1: " |> string.append(int.to_string(part_one)))
  io.println("Part 2: " |> string.append(int.to_string(part_two)))
}
