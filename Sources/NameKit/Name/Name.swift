//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Exposed

public struct Name {

    // Exposed

    // Protocol: CustomStringConvertible
    // Topic: Instance Properties

    public let description: String

    // Protocol: LosslessStringConvertible
    // Topic: Initializers

    public init?<D>(_ description: D)
    where D: StringProtocol {
        guard Self._isDescriptionValid(description) else {
            return nil
        }
        self.description = .init(description)
    }
}

extension Name {

    // Concealed

    // Type: Name
    // Topic: Main

    private static func _isDescriptionValid<D>(_ description: D) -> Bool
    where D: StringProtocol {
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

extension Name: StringRepresentable { }
