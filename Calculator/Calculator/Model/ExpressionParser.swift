//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minseong Kang on 2023/06/06.
//

enum ExpressionParser<T: CalculateItem, U: CalculateItem> {
	static func parse(from input: String) -> Formula<Double, Operator> {
		let operandsLinkedList = LinkedList<Double>()
		let operandQueue = CalculatorItemQueue(list: operandsLinkedList)
		
		let operatorsLinkedList = LinkedList<Operator>()
		let operatorQueue = CalculatorItemQueue(list: operatorsLinkedList)
		
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
		
		let formulaResult = Formula(operands: operandQueue, operators: operatorQueue)
		
		return formulaResult
	}
	
	static private func componentsByOperators(from input: String) -> [String] {
		let operatorList = Operator.allCases.compactMap { $0.rawValue }
		
		let expression = operatorList.reduce([input]) { partialResult, `operator` in
			return partialResult.map { $0.split(with: `operator`)}.flatMap { $0 }
		}
		
		return expression
	}
}
