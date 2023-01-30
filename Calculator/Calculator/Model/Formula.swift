//
//  Formula.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/28.
//

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    func result() -> Double {
        var result: Double = operands.dequeue()?.value ?? 0
        
        while operands.queue.isEmpty == false {
            guard let operatorValue = self.operators.dequeue()?.value,
                  let rhs = operands.dequeue()?.value
            else { break }
            
            result = operatorValue.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
}
