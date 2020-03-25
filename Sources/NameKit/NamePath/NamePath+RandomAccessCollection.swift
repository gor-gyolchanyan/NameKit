//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension NamePath: RandomAccessCollection {

    // Exposed

    // Protocol: RandomAccessCollection
    // Topic: Index

    public typealias Index = Int

    public var startIndex: Index {
        _path.startIndex
    }

    public var endIndex: Index {
        _path.endIndex
    }

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
    // Topic: Element

    public typealias Element = Name

    public subscript(_ index: Index) -> Element {
        _read {
            yield _path[index]
        }

        _modify {
            yield &_path[index]
        }
    }
}
