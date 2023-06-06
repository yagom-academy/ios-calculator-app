//
//  MockFormula.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

protocol MockFormulaProtocol {
	associatedtype T: CalculateItem
	associatedtype U: CalculateItem
	var operands: MockCalculatorItemQueue<T> { get }
	var operators: MockCalculatorItemQueue<U> { get }
	func result() -> Double
}

struct MockFormula<T: CalculateItem, U: CalculateItem>: MockFormulaProtocol {
	var operands: MockCalculatorItemQueue<T>
	var operators: MockCalculatorItemQueue<U>
	func result() -> Double {
		guard let lhsOperand = operands.dequeue() as? Double else { return 0.0 }
		guard let rhsOperand = operands.dequeue() as? Double else { return 0.0 }
		
		guard let `operator` = operators.dequeue() as? MockOperator else { return 0.0 }
		
		switch `operator` {
		case .add:
			return MockOperator.add.calculate(lhs: lhsOperand, rhs: rhsOperand)
		case .subtract:
			return MockOperator.subtract.calculate(lhs: lhsOperand, rhs: rhsOperand)
		case .divide:
			return MockOperator.divide.calculate(lhs: lhsOperand, rhs: rhsOperand)
		case .multiply:
			return MockOperator.multiply.calculate(lhs: lhsOperand, rhs: rhsOperand)
		}
	}
	init(operands: MockCalculatorItemQueue<T>, operators: MockCalculatorItemQueue<U>) {
		self.operands = operands
		self.operators = operators
	}
}
