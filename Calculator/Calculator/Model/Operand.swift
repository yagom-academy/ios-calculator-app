//
//  Operand.swift
//  Calculator
//
//  Created by yun on 2021/06/23.
//

import Foundation

class Operand: Computable {
    var operandValue: Operandable
    
    init(operand: Operandable) {
        self.operandValue = operand
    }
    
    static func checkType(of operand: String) -> Operandable {
        return 1
    }
}
