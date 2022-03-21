//
//  Formula.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    var _operandsCount: Int {
        return operands.count
    }
    
    var _operatorsCount: Int {
        return operators.count
    }
    
    init(operands: CalculatorItemQueue<Double>,
         operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        let firstOperand = try operands.dequeue()

        var result: Double = firstOperand
        
        while operands.isEmpty == false {
            let operand = try operands.dequeue()
            let `operator` = try operators.dequeue()
            
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
