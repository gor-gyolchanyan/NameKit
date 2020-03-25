//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

// Type: NameProtocol

public protocol NameProtocol: Hashable, Codable, Comparable, LosslessStringConvertible, ExpressibleByStringLiteral
where StringLiteralType == StaticString {

    // Exposed

    // Topic: Main

    init?<D>(_ description: D)
    where D: StringProtocol
}
