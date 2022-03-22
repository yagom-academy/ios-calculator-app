import Foundation

extension Double: CalculateItem {}
extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
