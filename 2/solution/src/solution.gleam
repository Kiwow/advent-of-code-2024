import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile

const filename = "../input.txt"

fn read_input() -> String {
  let assert Ok(contents) = simplifile.read(from: filename)
  string.trim(contents)
}

fn parse_report(report: String) -> List(Int) {
  string.split(report, " ")
  |> list.map(fn(n) {
    let assert Ok(number) = int.parse(n)
    number
  })
}

fn parse_reports(input: String) -> List(List(Int)) {
  string.split(input, on: "\n")
  |> list.map(parse_report)
}

fn is_within_threshold(pair, get_diff) {
  let #(l, r) = pair
  let diff = get_diff(l, r)
  0 < diff && diff <= 3
}

fn is_safe(report: List(Int)) -> Bool {
  let pairs = list.window_by_2(report)

  let is_descending =
    list.all(pairs, fn(pair) { is_within_threshold(pair, fn(l, r) { r - l }) })

  let is_ascending =
    list.all(pairs, fn(pair) { is_within_threshold(pair, fn(l, r) { l - r }) })

  is_ascending || is_descending
}

pub fn part_one() -> Int {
  let input = read_input()
  let reports = parse_reports(input)
  list.count(reports, is_safe)
}

pub fn main() {
  let part_one = part_one()

  io.println("Day 1: " |> string.append(int.to_string(part_one)))
}
