//
//  Operand.swift
//  Calculator
//
//  Created by yun on 2021/06/23.
//

import Foundation

protocol Operandable { }

extension Int: Operandable { }
extension Double: Operandable { }

class Operand: Computable {
    var operandValue: Operandable
    
    init?(operand: String) {
        guard let operandValue = Operand.conversionOperandable(of: operand) else {
            return nil
        }
        self.operandValue = operandValue
    }
    
    private static func conversionOperandable(of operand: String) -> Operandable? {
        return Int(1)
    }
}
