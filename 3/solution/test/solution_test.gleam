import gleeunit
import gleeunit/should
import simplifile
import solution

pub fn main() {
  gleeunit.main()
}

const filename = "../sample.txt"

pub fn part1_test() {
  let assert Ok(input) = simplifile.read(filename)
  let result = solution.part_one(input)

  result
  |> should.equal(161)
}
// pub fn part2_test() {
//   let assert Ok(input) = simplifile.read(filename)
//   let result = solution.part_two(input)

//   result
//   |> should.equal(2)
// }
