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
		while let operands = operands.flatMap({ $0.mockList?.head?.value }) {
			guard let operands = operands as? Double else { return -1.0 }
			return operands
		}
		
		return -1.0
	}
	
	init(operands: MockCalculatorItemQueue<T>, operators: MockCalculatorItemQueue<U>) {
		self.operands = operands
		self.operators = operators
	}
}
