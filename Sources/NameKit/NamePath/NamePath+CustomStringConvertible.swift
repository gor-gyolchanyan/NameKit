//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension NamePath: CustomStringConvertible {

    // Exposed

    // Protocol: CustomStringConvertible
    // Topic: Main

    public var description: String {
        _path
            .lazy.map { $0.description }
            .joined(separator: .init(Self._separatorCharacter))
    }
}
