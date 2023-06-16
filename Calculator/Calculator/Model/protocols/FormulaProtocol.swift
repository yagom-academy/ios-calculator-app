//
//  FormulaProtocol.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/15.
//

protocol FormulaProtocol {
	associatedtype T: CalculateItem
	associatedtype U: CalculateItem
	var operands: CalculatorItemQueue<T> { get }
	var operators: CalculatorItemQueue<U> { get }
	mutating func result() throws -> Double
}
