//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

public protocol StringRepresentable: Hashable, Codable, LosslessStringConvertible, ExpressibleByStringLiteral
where StringLiteralType == StaticString {

}

extension StringRepresentable
where Self: RawRepresentable, RawValue: LosslessStringConvertible {

    // Exposed

    // Type: StringRepresentable
    // Topic: RawRepresentable

    public init?(_ description: String) {
        guard let rawValue = RawValue(description) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public var description: String {
        rawValue.description
    }
}

extension StringRepresentable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        return some.description == other.description
    }
}

extension StringRepresentable {

    // Exposed

    // Protocol: Hashable
    // Topic: Providing a Hash Value

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}

extension StringRepresentable {

    // Exposed

    // Protocol: Encodable
    // Topic: Instance Methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}

extension StringRepresentable {

    // Exposed

    // Protocol: Decodable
    // Topic: Initializers

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let description = try container.decode(String.self)
        guard let theSelf = Self(description) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid description for \(String(reflecting: Self.self)): \(String(reflecting: description))."
            )
        }
        self = theSelf
    }
}

extension StringRepresentable {

    // Exposed

    // Protocol: ExpressibleByStringLiteral
    // Topic: Initializers

    public init(stringLiteral literal: StringLiteralType) {
        let description = literal.withUTF8Buffer { utf8Buffer in
            String(decoding: utf8Buffer, as: Unicode.UTF8.self)
        }
        guard let newSelf = Self(description) else {
            preconditionFailure("Invalid description \(String(reflecting: description))) of \(String(reflecting: Self.self)).")
        }
        self = newSelf
    }
}
