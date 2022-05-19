//
//  Formula.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    mutating func result() -> Double {
        var result = operands.queue.dequeue() ?? 0.0
       
        while operators.queue.isEmpty == false {
            let `operator` = operators.queue.dequeue() ?? ""
            let operatorCase = Operator(rawValue: Character(`operator`))
            
            result = operatorCase?.calculate(lhs: result, rhs: operands.queue.dequeue() ?? 0.0) ?? 0.0
            }
        return result
    }
}


