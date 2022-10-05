//
//  StringExtension.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

extension String {
    var isDouble: Bool {
        return Double(self) != nil ? true : false
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}
