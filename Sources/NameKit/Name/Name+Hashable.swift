//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: Name

extension Name: Hashable {

    // Protocol: Hashable
    // Topic: Main

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
