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
		return 0.0
	}
}
