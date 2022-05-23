//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operators = componentsByOperators(from: input)
        var operands = input.split { operators.contains(String($0)) }.map { Double($0) ?? 0.0 }
        var operatorsQueue = CalculatorItemQueue<String>()
        var operandsQueue = CalculatorItemQueue<Double>()
        
        if input.first == "-" {
            operators.removeFirst()
            operands[0] = -(operands[0])
        }

        operators.forEach { operatorsQueue.queue.enqueue(element: $0) }
        operands.forEach { operandsQueue.queue.enqueue(element: $0) }
        
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = input.filter { $0.isNumber == false && $0 != "." }.map { String($0) }
        
        return operators
    }
}
