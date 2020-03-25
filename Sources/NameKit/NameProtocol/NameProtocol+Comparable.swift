//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

extension NameProtocol {

    // Exposed
    
    // Protocol: Comparable
    // Topic: Main

    public static func < (_ some: Self, _ other: Self) -> Bool {
        return some.description < other.description
    }
}
