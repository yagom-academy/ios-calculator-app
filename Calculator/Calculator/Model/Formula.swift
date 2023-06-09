//
//  Formula.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

struct Formula<T: CalculateItem, U: CalculateItem>: FormulaProtocol {
	var operands: CalculatorItemQueue<T>
	var operators: CalculatorItemQueue<U>
	
	func result() -> Double {
		var operandsList: [Double] = []
		while let operands = operands.dequeue() {
			guard let operand = operands as? Double else { return -1.0 }
			operandsList.append(operand)
		}
		
		let lhsOperand = operandsList[operandsList.startIndex]
		let rhsOperand = operandsList[operandsList.endIndex-1]

		guard let operators = operators.dequeue() as? Operator else { return -3.0 }
		
		switch operators {
		case .add:
			return lhsOperand + rhsOperand
		case .subtract:
			return lhsOperand - rhsOperand
		case .divide:
			return lhsOperand / rhsOperand
		case .multiply:
			return lhsOperand * rhsOperand
		}
	}
	
	init(operands: CalculatorItemQueue<T>, operators: CalculatorItemQueue<U>) {
		self.operands = operands
		self.operators = operators
	}
}
