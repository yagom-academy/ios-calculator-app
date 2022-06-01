//
//  String+Extensions.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
    
    func doubleValue() -> Double {
        return Double(self) ?? 0.0
    }
}
