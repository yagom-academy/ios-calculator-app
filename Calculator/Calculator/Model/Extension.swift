//
//  Extension.swift
//  Calculator
//

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let subStrings = self.split(separator: target)
        var strings: [String] = []
        
        subStrings.forEach { strings.append(String($0)) }
        return strings
    }
}
