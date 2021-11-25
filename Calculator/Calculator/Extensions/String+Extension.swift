//
//  String+Extension.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var hasMeaninglessDecimal: Bool {
        return self.hasSuffix(String.decimalPoint)
            || (self.contains(String.decimalPoint) && self.hasSuffix(String.zero))
    }
    
    func split(with target: Character) -> [String] {
        return components(separatedBy: target.description)
    }
    
    func notContains(_ input: String) -> Bool {
        return !contains(Character(input))
    }
}
