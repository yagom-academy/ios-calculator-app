//
//  Operand.swift
//  Calculator
//
//  Created by yun on 2021/06/23.
//

import Foundation

class Operand {
   private var operandValue: Double
    var getOperandValue: Double {
        return operandValue
    }
    
    init?(operand: String) {
        guard let operandValue = Double(operand) else {
            return nil
        }
        self.operandValue = operandValue
    }
    
    init(operand: Double) {
        self.operandValue = operand
    }
    
    func plus(with operand: Operand) -> Double {
        return self.operandValue + operand.getOperandValue
    }
    
    func minus(with operand: Operand) -> Double {
        return self.operandValue - operand.getOperandValue
    }
    
    func multiple(with operand: Operand) -> Double {
        return self.operandValue * operand.getOperandValue
    }
    
    func divide(by operand: Operand) throws -> Double {
        let invalidRhsValue: Double = 0
        guard operand.getOperandValue != invalidRhsValue else {
            throw CalculatorError.dividedByZero
        }
        return self.operandValue / operand.getOperandValue
    }
}
