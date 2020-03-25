//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension NamePath {

    // Exposed

    // Protocol: NameProtocol
    // Topic: Main

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

    // Concealed

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
