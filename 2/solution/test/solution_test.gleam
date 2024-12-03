import gleeunit
import gleeunit/should
import solution

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn part1_test() {
  solution.part_one()
  |> should.equal(2)
}
