//
//  Fomula.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/27.
//

import Foundation

struct Formula {
    
    // MARK: - Properties
    
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    // MARK: - Action
    
    func result() -> Double {
        let lhs = operands.dequeue()
        let rhs = operands.dequeue()
        
        let result = Operator.add.calculate(lhs: lhs!.data, rhs: rhs!.data)

        return result
    }
}
