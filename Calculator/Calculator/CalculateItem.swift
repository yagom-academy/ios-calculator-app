protocol CalculateItem {
    
}

extension Double: CalculateItem { }
extension Operator: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
