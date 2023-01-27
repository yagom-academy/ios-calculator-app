//
//  Extension.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation

extension Operator: CalculatorItem {
    
}

extension Double: CalculatorItem {
    
}
extension String {
    func split(with target: Character) -> [String] {
        
        return split(separator: target).map { String($0) }
    }
}
