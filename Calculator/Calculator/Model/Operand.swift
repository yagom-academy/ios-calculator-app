//
//  Operand.swift
//  Calculator
//
//  Created by yun on 2021/06/23.
//

import Foundation

class Operand: Computable {
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
    
    func plus(with rhs: Operand) -> Double {
        return self.operandValue + rhs.getOperandValue
    }
    
    func minus(with rhs: Operand) -> Double {
        return self.operandValue - rhs.getOperandValue
    }
    
    func multiple(with rhs: Operand) -> Double {
        return self.operandValue * rhs.getOperandValue
    }
    
    func divide(by rhs: Operand) throws -> Double {
        let invalidRhsValue: Double = 0
        guard rhs.getOperandValue != invalidRhsValue else {
            throw CalculatorError.dividedByZero
        }
        return self.operandValue / rhs.getOperandValue
    }
}
