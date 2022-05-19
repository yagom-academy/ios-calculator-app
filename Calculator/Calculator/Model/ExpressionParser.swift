//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let operators = componentsByOperators(from: input)
        let operands = input.split { operators.contains(String($0))}.map {String($0)}
        var operatorsQueue = CalculatorItemQueue<String>()
        var operandsQueue = CalculatorItemQueue<Double>()
        
        operators.forEach { operatorsQueue.queue.enqueue(element: $0)
        }
        operands.forEach { operandsQueue.queue.enqueue(element: Double($0) ?? 0.0)
        }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let operators = input.filter { $0.isNumber == false }.map { String($0) }
        return operators
    }
}
