use std::fs;

const FILENAME: &str = "../input.txt";

fn read_input() -> String {
    let contents = fs::read_to_string(FILENAME).expect("Input file doesn't exist");
    contents
}

fn main() {
    let input = read_input();
    let (left, right): (Vec<_>, Vec<_>) = input
        .split_whitespace()
        .map(|num| num.parse::<i64>().expect("Failed to parse i64"))
        .enumerate()
        .partition(|(index, _)| index % 2 == 0);

    let mut left: Vec<_> = left.into_iter().map(|(_, num)| num).collect();
    let mut right: Vec<_> = right.into_iter().map(|(_, num)| num).collect();

    left.sort();
    right.sort();

    let result: i64 = left
        .iter()
        .zip(right.iter())
        .map(|(left, right)| i64::abs(left - right))
        .sum();

    println!("{}", result);
}
