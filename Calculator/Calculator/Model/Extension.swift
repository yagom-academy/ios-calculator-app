
import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let targetPlusEmptySpace = self.replacingOccurrences(of: String(target), with: " \(target) ")
        return targetPlusEmptySpace.components(separatedBy: " ").map{ String($0) }
    }
}


