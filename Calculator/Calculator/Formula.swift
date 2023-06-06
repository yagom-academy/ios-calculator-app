//
//  Formula.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//



struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var isEmptyOperators: Bool = operators.currentList().isEmpty
        var isEmptyOperands: Bool = operands.currentList().isEmpty
        var result: Double = 0
        
        guard let lhs: Double = operands.dequeue() else {
            return 0
        }
        
        guard let rhs: Double = operands.dequeue() else {
            return 0
        }
        
        guard let operation: Operator = operators.dequeue() else {
            return 0
        }
        
        result = operation.calculate(lhs: lhs, rhs: rhs)
        
        while !(isEmptyOperators || isEmptyOperands) {
            var lhs: Double = result
            
            guard let rhs: Double = operands.dequeue() else {
                return 0
            }
            
            guard let operation: Operator = operators.dequeue() else {
                return 0
            }
            
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}
