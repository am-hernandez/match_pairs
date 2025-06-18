// Function receives two public fields and one private field. Assert the public fields point to the same values in the private field's array.
fn main(x: [str<1>; 16], y: pub u32, z: pub u32) {
    assert(x[y] == x[z]);
}

#[test]
fn test_main() {
    main(
        ["E", "C", "A", "D", "G", "H", "B", "G", "C", "F", "H", "E", "F", "A", "B", "D"],
        3,
        15,
    );
}

#[test(should_fail)]
fn test_failure() {
    main(
        ["A", "B", "C", "D", "E", "F", "G", "H", "A", "B", "C", "D", "E", "F", "G", "H"],
        1,
        5,
    );
}
