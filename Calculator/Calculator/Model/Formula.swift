//
//  Formula.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

struct Formula {
	var operands: CalculatorItemQueue<Double>
	var operators: CalculatorItemQueue<Operator>
	
    init(operands: [Double] = [], operators: [Operator] = []) {
        self.operands = CalculatorItemQueue(operands)
        self.operators = CalculatorItemQueue(operators)
    }
    
	mutating func result() throws -> Double {
        guard var result =  operands.dequeue() else { throw CalculationError.emptyOperand }
		
		while !operands.isEmpty {
            guard let operatorItem = operators.dequeue() else { throw CalculationError.emptyOperator}
            guard let rhs = operands.dequeue() else { throw CalculationError.emptyOperand}
			result = operatorItem.calculate(lhs: result, rhs: rhs)
		}
		return result
	}
}
