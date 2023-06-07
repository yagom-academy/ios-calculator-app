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
	
	static func componentsByOperators(from input: String) -> [String] {
		var expressions: [String] = []
		var operatorList: [String] = []
		
		let operators = Operator.allCases.compactMap { String($0.rawValue) }
		for `operator` in operators {
			operatorList.append(`operator`)
		}
		
		input.forEach {
			expressions.append(String($0))
		}
		
		operatorList.forEach {
			let isContainOperator = expressions.contains($0)
			guard isContainOperator else { return }
			guard let operatorIndex = expressions.firstIndex(of: $0) else { return }
			expressions.remove(at: operatorIndex)
		}
		
		return expressions
	}
}
