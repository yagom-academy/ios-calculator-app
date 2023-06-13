//
//  MockExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/07.
//

enum MockExpressionParser<T: CalculateItem, U: CalculateItem> {	
	static func parse(from input: String) -> MockFormula<Double, Operator> {
		let operandsLinkedList = LinkedList<Double>()
		let operatorsLinkedList = LinkedList<Operator>()
		let operandQueue = MockCalculatorItemQueue(list: operandsLinkedList)
		let operatorQueue = MockCalculatorItemQueue(list: operatorsLinkedList)
		
		let operands = componentsByOperators(from: input).compactMap { Double($0) }
		operands.forEach {
			operandQueue.enqueue($0)
		}
		
		let operatorList = Operator.allCases.compactMap { $0.rawValue }
		operatorList.forEach {
			guard input.contains($0) else { return }
			guard let `operator` = Operator(rawValue: $0) else { return }
			operatorQueue.enqueue(`operator`)
		}
		
		let result = MockFormula(operands: operandQueue, operators: operatorQueue)
		
		return result
	}
	
	static func componentsByOperators(from input: String) -> [String] {
		let operatorList = Operator.allCases.compactMap { $0.rawValue }
		
		let expression = operatorList.reduce([input]) { partialResult, `operator` in
			return partialResult.map { $0.split(with: `operator`)}.flatMap { $0 }
		}
		
		return expression
	}
}
