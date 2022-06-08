//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Borysarang, Yeton on 2022/05/20.
//
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        var formula = Formula(operands: operandsQueue, operators: operatorQueue)
        let operands: [String] = componentsByOperators(from: input)
        let inputSpacesRemoved = input.split(with: Character(" ")).joined()
        let operators = inputSpacesRemoved.filter { !$0.isNumber }.map { String($0) }
    
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
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputSpacesRemoved = input.split(with: Character(" ")).joined()
        let operands = inputSpacesRemoved.components(separatedBy:["+","−","÷","×"])
        
        return operands
    }
}
