//
//  Formula.swift
//  Calculator
//
//  Created by karen, Mary.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() throws -> Double {
        var operandsQueue = operands
        var operatorsQueue = operators
        
        while !operatorsQueue.isEmpty {
            guard let operatorValue = operatorsQueue.dequeue() else { break }
            guard let lhs = operandsQueue.dequeue(), let rhs = operandsQueue.dequeue() else { break }
            
            let result = try operatorValue.calculate(lhs: lhs, rhs: rhs)
            operandsQueue.enqueue(result)
        }
        
        return operandsQueue.dequeue() ?? 0
    }
}
