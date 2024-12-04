import gleeunit
import gleeunit/should
import solution

pub fn main() {
  gleeunit.main()
}

const filename = "../sample.txt"

pub fn part1_test() {
  let reports = solution.get_reports(filename)
  solution.part_one(reports)
  |> should.equal(2)
}

pub fn part2_test() {
  let reports = solution.get_reports(filename)
  solution.part_two(reports)
  |> should.equal(4 + 9)
}
