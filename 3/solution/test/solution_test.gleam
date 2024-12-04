import gleeunit
import gleeunit/should
import simplifile
import solution

pub fn main() {
  gleeunit.main()
}

pub fn part1_test() {
  let assert Ok(input) = simplifile.read("../sample.txt")
  let result = solution.part_one(input)

  result
  |> should.equal(161)
}

pub fn part2_test() {
  let assert Ok(input) = simplifile.read("../sample2.txt")
  let result = solution.part_two(input)

  result
  |> should.equal(48)
}
