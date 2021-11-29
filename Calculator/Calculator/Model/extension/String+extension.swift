//
//  String+extension.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var hasUnnecessaryDecimal: Bool {
        return self.hasSuffix(String.decimalPoint)
            || (self.contains(String.decimalPoint) && self.hasSuffix(String.zero))
    }
    
    mutating func removeUnnecessaryDecimal() -> String {
        while self.hasUnnecessaryDecimal {
            self.removeLast()
        }
        
        return self
    }
    
    func split(with target: Character) -> [String] {
        return components(separatedBy: target.description)
    }
    
    func notContains(_ input: String) -> Bool {
        return !contains(Character(input))
    }
}
