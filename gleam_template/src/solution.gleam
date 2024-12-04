import gleam/io
import gleam/string
import simplifile

pub fn part_one(input: String) {
  todo
}

// pub fn part_two(input: String) {
//   todo
// }

pub fn main() {
  let assert Ok(input) = simplifile.read("../input.txt")
  let part_one = part_one(input)
  // let part_two = part_two(input)

  // io.println("Part 1: " |> string.append(int.to_string(part_one)))
  // io.println("Part 2: " |> string.append(int.to_string(part_two)))
}
