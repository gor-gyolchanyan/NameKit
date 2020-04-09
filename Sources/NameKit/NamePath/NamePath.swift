//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

public struct NamePath {

    // Concealed

    // Type: NamePath
    // Topic: Main

    init(_path path: _Path) {
        _path = path
    }

    var _path: _Path
}

extension NamePath {

    // Exposed

    // Type: NamePath
    // Topic: Main

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

    // Type: NamePath
    // Topic: Main

    typealias _Path = [Name]

    static let _separatorCharacter: Character = "."

    static func _append<D>(_ description: D, isMultiple: Bool, to path: inout _Path) -> Bool
    where D: StringProtocol {
        guard !description.isEmpty else {
            return true
        }
        if isMultiple {
            guard let index = description.firstIndex(of: Self._separatorCharacter) else {
                return _append(description, isMultiple: false, to: &path)
            }
            let prefix = description[..<index]
            let postfix = description[description.index(after: index)...]
            guard _append(prefix, isMultiple: false, to: &path) else {
                return false
            }
            return _append(postfix, isMultiple: true, to: &path)
        } else {
            guard let name = Name(description) else {
                return false
            }
            path.append(name)
            return true
        }
    }
}

extension NamePath: CustomStringConvertible {

    // Exposed

    // Protocol: CustomStringConvertible
    // Topic: Instance Properties

    public var description: String {
        _path
            .lazy.map { $0.description }
            .joined(separator: .init(Self._separatorCharacter))
    }
}

extension NamePath: LosslessStringConvertible {

    // Exposed

    // Protocol: LosslessStringConvertible
    // Topic: Initializers

    public init?<D>(_ description: D)
    where D: StringProtocol {
        var path = _Path()
        guard
            Self._append(description, isMultiple: true, to: &path),
            !path.isEmpty
        else {
            return nil
        }
        self.init(_path: path)
    }
}

extension NamePath: RandomAccessCollection {

    // Exposed

    // Protocol: RandomAccessCollection
    // Topic: Associated Types

    public typealias Index = Int

    public typealias Element = Name

    // Protocol: RandomAccessCollection
    // Topic: Instance Properties

    public var startIndex: Index {
        _path.startIndex
    }

    public var endIndex: Index {
        _path.endIndex
    }

    // Protocol: RandomAccessCollection
    // Topic: Instance Methods

    public func index(after otherIndex: Index) -> Index {
        _path.index(after: otherIndex)
    }

    public func index(before otherIndex: Index) -> Index {
        _path.index(before: otherIndex)
    }

    public func index(_ otherIndex: Index, offsetBy distance: Int) -> Index {
        _path.index(otherIndex, offsetBy: distance)
    }

    public func index(_ otherIndex: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
        _path.index(otherIndex, offsetBy: distance, limitedBy: limit)
    }

    // Protocol: RandomAccessCollection
    // Topic: Subscripts

    public subscript(_ index: Index) -> Element {
        _read {
            yield _path[index]
        }

        _modify {
            yield &_path[index]
        }
    }
}

extension  NamePath: StringRepresentable { }
