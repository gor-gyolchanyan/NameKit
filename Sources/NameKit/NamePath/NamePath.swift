//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

// Type: NamePath

public struct NamePath: NameProtocol {

    // Concealed

    // Topic: Main

    init(_path path: _Path) {
        _path = path
    }

    var _path: _Path
}

extension NamePath {

    // Exposed

    public init<E>(_ elements: E)
    where E: Sequence, E.Element == Element {
        self.init(_path: .init(elements))
    }

    public mutating func append(_ element: Element) {
        _path.append(element)
    }

    public mutating func append<E>(contentsOf elements: E)
    where E: Sequence, E.Element == Element {
        _path.append(contentsOf: elements)
    }

    // Concealed

    // Topic: Main

    typealias _Path = [Name]

    static let _separatorCharacter: Character = "."
}
