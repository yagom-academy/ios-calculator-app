//
//  Fomula.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/27.
//

struct Formula {
    
    // MARK: - Properties
    
    private let operands: CalculatorItemQueue<Double>
    private let operators: CalculatorItemQueue<Operator>
    
    // MARK: - Initializer
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    // MARK: - Action
    
    func result() throws -> Double {
        guard var result = operands.dequeue()?.data else { throw CalculatorError.emptyCalculatorItemQueue }
        
        while let mathOperator = operators.dequeue()?.data,
              let currentNumber = operands.dequeue()?.data {
            result = try mathOperator.calculate(lhs: result, rhs: currentNumber)
        }

        return result
    }
}
