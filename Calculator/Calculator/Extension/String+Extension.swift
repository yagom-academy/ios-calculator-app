import Foundation

extension String {
    static var empty: Self {
        return ""
    }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: target.description)
    }
}
