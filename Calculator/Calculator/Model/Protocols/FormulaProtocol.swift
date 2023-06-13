//
//  FormulaProtocol.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/09.
//

protocol FormulaProtocol {
	associatedtype T: CalculateItem
	associatedtype U: CalculateItem
	var operands: CalculatorItemQueue<T> { get }
	var operators: CalculatorItemQueue<U> { get }
	func result() -> Double
}
