import gleam/io
import gleam/string
import simplifile

const filename = "../sample.txt"

fn read_input() -> String {
  let assert Ok(contents) = simplifile.read(from: filename)
  string.trim(contents)
}

pub fn main() {
  let input = read_input()
  io.println(input)
}
