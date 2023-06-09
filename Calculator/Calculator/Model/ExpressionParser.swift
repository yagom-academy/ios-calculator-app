//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

enum ExpressionParser<T: CalculateItem> {
	static func parse(from input: String) -> Formula<T> {
		let operandsLinkedList = LinkedList<T>()
		let operatorsLinkedList = LinkedList<T>()
		let operands = CalculatorItemQueue(list: operandsLinkedList)
		let operators = CalculatorItemQueue(list: operatorsLinkedList)
		let result = Formula(operands: operands, operators: operators)
		
		return result
	}
	
	static private func componentsByOperators(from input: String) -> [String] {
		let operatorList = Operator.allCases.compactMap { $0.rawValue }
		
		let expression = operatorList.reduce([input]) { partialResult, `operator` in
			return partialResult.map { $0.split(with: `operator`)}.flatMap { $0 }
		}
		
		return expression
	}
}
