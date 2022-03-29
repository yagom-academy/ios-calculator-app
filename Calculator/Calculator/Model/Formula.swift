//
//  Formula.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<LinkdeList<Double>>
    let operators: CalculatorItemQueue<LinkdeList<Operator>>
    
    func result() throws -> Double {
        guard var firstOperand = operands.dequeue() else {
            throw CalauletorError.operandIsNil
        }
        
        while operands.isEmpty == false {
            guard let operandValue = operands.dequeue() else {
                throw CalauletorError.operandIsNil
            }
            
            guard let operatorValue = operators.dequeue() else {
                throw CalauletorError.operatorIsNil
            }
            
            firstOperand = try operatorValue.calculate(lhs: firstOperand, rhs: operandValue)
        }
        let result = firstOperand
        
        return result
    }
}
