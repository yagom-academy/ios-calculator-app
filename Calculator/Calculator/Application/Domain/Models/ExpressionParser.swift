//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        let operators = componentsByOperators(from: input)
        let operands = input.split { operators.contains(String($0)) }.map { String($0) }
        
        operators.forEach {
            if let `operator` = Operator(rawValue: Character($0)) {
                formula.operators.enqueue(`operator`)
            }
        }
        operands.forEach {
            if let operand = Double($0) {
                formula.operands.enqueue(operand)
            }
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = input.filter { !$0.isNumber }.map { String($0) }
        return operators
    }
}
