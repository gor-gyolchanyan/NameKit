//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension NameProtocol {

    // Exposed

    // Protocol: ExpressibleByStringLiteral
    // Topic: Main

    public init(stringLiteral value: StringLiteralType) {
        let description = value.withUTF8Buffer { utf8Buffer in
            String(decoding: utf8Buffer, as: Unicode.UTF8.self)
        }
        guard let newSelf = Self(description) else {
            preconditionFailure("Invalid description \(String(reflecting: description))) of \(String(reflecting: Self.self)).")
        }
        self = newSelf
    }
}
