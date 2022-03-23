import Foundation

protocol CalculateItem {
    
}

extension Int: CalculateItem {
    
}

extension Double: CalculateItem {
    
}

extension Character: CalculateItem {
    
}

extension String {
    public func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
