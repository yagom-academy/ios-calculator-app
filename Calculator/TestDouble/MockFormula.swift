//
//  MockFormula.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

protocol MockFormulaProtocol {
	associatedtype T: CalculateItem
	associatedtype U: CalculateItem
	var operands: MockCalculatorItemQueue<T>? { get }
	var operators: MockCalculatorItemQueue<U>? { get }
	func result() -> Double
}

struct MockFormula<T: CalculateItem, U: CalculateItem>: MockFormulaProtocol {
	var operands: MockCalculatorItemQueue<T>?
	var operators: MockCalculatorItemQueue<U>?
	
	func result() -> Double {
		let lhs = operands.flatMap { $0.mockList?.head?.value }
		guard let lhsOperand = lhs as? Double else { return -1.0 }
		
		let rhs = operands.flatMap { $0.mockList?.tail?.value }
		guard let rhsOperand = rhs as? Double else { return -1.0 }
		
		return lhsOperand
	}
	
	init(operands: MockCalculatorItemQueue<T>, operators: MockCalculatorItemQueue<U>) {
		self.operands = operands
		self.operators = operators
	}
}
