//
//  MockExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/07.
//

enum MockExpressionParser<T: CalculateItem> {
	static func parse(from input: String) -> Formula<T> {
		let operandsLinkedList = LinkedList<T>()
		let operatorsLinkedList = LinkedList<T>()
		let operands = CalculatorItemQueue(list: operandsLinkedList)
		let operators = CalculatorItemQueue(list: operatorsLinkedList)
		let result = Formula(operands: operands, operators: operators)
		
		return result
	}
	
	static private func componentsByOperators(from input: String) -> [String] {
		return [""]
	}
}
