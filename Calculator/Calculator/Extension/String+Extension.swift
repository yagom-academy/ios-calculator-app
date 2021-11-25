import Foundation

extension String {
    static var empty: Self {
        return ""
    }
    
    func split(with target: Character) -> [Self] {
        return self.components(separatedBy: target.description)
    }
    
    func removedComma() -> Self {
        return self.replacingOccurrences(of: CalculatorSymbol.Comma, with: Self.empty)
    }
}
