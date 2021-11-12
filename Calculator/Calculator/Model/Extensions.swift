import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedString: [String] = self.split(separator: target).map { String($0) }
        return splitedString
    }
}

extension Double: CalculateItem {
}


