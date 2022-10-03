//
//  Formula.swift
//  Created by 미니.
//

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: [Double], operators: [Operator]) {
        self.operands = CalculatorItemQueue(elements: operands)
        self.operators = CalculatorItemQueue(elements: operators)
    }
    
    mutating func result() -> Double? {
        guard var result = operands.dequeue() else { return nil }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operatorSign = operators.dequeue(),
                  let rhs = operands.dequeue() else { return result }
            
            result = operatorSign.calculate(lhs: result, rhs: rhs)
        }

        return result
    }
}
