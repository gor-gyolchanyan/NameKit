//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

extension Name: ExpressibleByStringLiteral {

    // Exposed

    // Protocol: ExpressibleByStringLiteral
    // Topic: Main

    public typealias StringLiteralType = StaticString

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
