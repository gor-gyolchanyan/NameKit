//
// Introductory information can be found in the `README.md` file in the root directory of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file in the root directory of the repository that contains this file.
//

// Type: Name

extension Name: Decodable {

    // Protocol: Decodable
    // Topic: Main

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let description = try container.decode(String.self)
        guard let newSelf = Self(description) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid description \(String(reflecting: description))) of \(String(reflecting: Self.self)).")
        }
        self = newSelf
    }
}
