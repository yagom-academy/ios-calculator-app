//  Formula.swift
//  Created by zhilly on 2022/09/26.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        if operands.isEmpty == true {
            return 0.0
        }
        
        var formulaResult: Double? = operands.dequeue()
        
        while !operands.isEmpty || !operators.isEmpty {
            guard let lhs = formulaResult else { return .nan }
            guard let rhs = operands.dequeue() else { return .nan }
            formulaResult = operators.dequeue()?.calculate(lhs: lhs, rhs: rhs)
        }
        
        return formulaResult ?? .nan
    }
}
