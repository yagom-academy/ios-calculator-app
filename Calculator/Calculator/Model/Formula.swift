//  Formula.swift
//  Created by zhilly and Gundy on 2022/10/04.

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard var leftNumber = operands.dequeue() else { return Double.zero }
        
        while let rightNumber = operands.dequeue() {
            guard let operatorSign = operators.dequeue() else {
                throw FormulaError.unexpectedError
            }
            leftNumber = operatorSign.calculate(lhs: leftNumber, rhs: rightNumber)
        }
        
        return leftNumber
    }
}

