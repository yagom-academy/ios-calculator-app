//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        guard var resultValue: Double = operands.dequeue() else { return 0.0 }
        while let rhs = operands.dequeue(),
              let operatorSymbol = operators.dequeue() {
            resultValue = operatorSymbol.calculate(lhs: resultValue, rhs: rhs)
        }
        return resultValue
    }
}
