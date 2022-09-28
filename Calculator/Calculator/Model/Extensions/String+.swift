//
//  String+.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target, omittingEmptySubsequences: false).map { String($0) }
    }
    
    var isNumber: Bool {
        return Double(self) != nil ? true : false
    }
}
