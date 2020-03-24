//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: Name

public struct Name: LosslessStringConvertible {

    // Exposed

    // Protocol: CustomStringConvertible
    // Topic: Main

    public let description: String

    // Protocol: LosslessStringConvertible
    // Topic: Main

    public init?(_ description: String) {
        guard Self._isDescriptionValid(description) else {
            return nil
        }
        self.description = description
    }
}

extension Name {

    // Concealed

    private static func _isDescriptionValid(_ description: String) -> Bool {
        let description = description.unicodeScalars[...]
        guard
            let first = description.first,
            first.properties.isXIDStart
        else {
            return false
        }
        let rest = description.dropFirst()
        guard
            rest.allSatisfy({ $0.properties.isXIDContinue })
        else {
            return false
        }
        return true
    }
}
