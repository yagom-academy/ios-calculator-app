import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}

extension Double: CalculateItem {
}


