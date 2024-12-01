use std::{collections::HashMap, fs};

const FILENAME: &str = "../input.txt";

fn read_input() -> String {
    let contents = fs::read_to_string(FILENAME).expect("Input file doesn't exist");
    contents
}

fn countmap(data: Vec<i32>) -> HashMap<i32, i32> {
    let mut map = HashMap::new();
    for num in data {
        *map.entry(num).or_default() += 1;
    }
    map
}

fn main() {
    let input = read_input();
    let (left, right): (Vec<_>, Vec<_>) = input
        .split_whitespace()
        .map(|num| num.parse::<i32>().expect("Failed to parse i32"))
        .enumerate()
        .partition(|(index, _)| index % 2 == 0);

    let left: Vec<_> = left.into_iter().map(|(_, num)| num).collect();
    let right: Vec<_> = right.into_iter().map(|(_, num)| num).collect();

    let right_countmap = countmap(right);

    let similarity: i32 = left
        .into_iter()
        .map(|num| num * right_countmap.get(&num).unwrap_or(&0))
        .sum();

    println!("{}", similarity);
}
