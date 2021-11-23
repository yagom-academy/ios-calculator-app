import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: target.description)
    }
}
