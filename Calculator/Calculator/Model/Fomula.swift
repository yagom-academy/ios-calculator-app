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
        var method: Operator?
        var rhs: Double?
       
        var temp = operands.dequeue()?.data
        while operators.isEmpty() == false {
            method = operators.dequeue()?.data
            rhs = operands.dequeue()?.data
            temp = method?.calculate(lhs: temp!, rhs: rhs!)
        }
        
        let result = temp!
        return result
    }
}
