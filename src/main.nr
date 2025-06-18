/// Verifies that two indices point to the same value in an array.
///
/// # Arguments
///
/// * `pairing_options` - An array of 16 single-character strings
/// * `first_choice` - A public index into the array
/// * `second_choice` - A public index into the array
///
/// # Returns
///
/// This function asserts that the values at indices `first_choice` and `second_choice` in array `pairing_options` are equal.
fn main(pairing_options: [str<1>; 16], first_choice: pub u32, second_choice: pub u32) {
    assert(pairing_options[first_choice] == pairing_options[second_choice]);
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
