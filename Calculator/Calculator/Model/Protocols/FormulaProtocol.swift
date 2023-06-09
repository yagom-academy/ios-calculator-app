//
//  FormulaProtocol.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/09.
//

protocol FormulaProtocol {
	associatedtype T: CalculateItem
	var operands: CalculatorItemQueue<T> { get }
	var operators: CalculatorItemQueue<T> { get }
	func result() -> Double
}
