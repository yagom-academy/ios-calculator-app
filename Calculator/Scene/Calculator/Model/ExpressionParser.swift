//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = filterOperands(input)
        let operators = filterOperators(input)
        
        return makeFormula(operands, operators)
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        let operators = input.filter { self.isOperator($0) }.map { String($0) }
        
        return operators
    }
    
    private static func filterOperands(_ input: String) -> [Double] {
        let operatorsForSplit = componentByOperators(from: input)
        let operands = input.split { operatorsForSplit.contains(String($0)) }.compactMap { Double($0) }
        
        return operands
    }
    
    private static func filterOperators(_ input: String) -> [Operator] {
        let operators = componentByOperators(from: input).compactMap { Operator(rawValue: $0) }
        
        return operators
    }
    
    private static func makeFormula(_ operands: [Double], _ operators: [Operator]) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        operators.forEach { operatorsQueue.queue.enqueue($0) }
        operands.forEach { operandsQueue.queue.enqueue($0) }
        
        return Formula(operand: operandsQueue, operator: operatorsQueue)
    }

    private static func isOperator(_ input: Character) -> Bool {
        if isNumber(input) || isNumberSymbol(input) {
            return false
        } else {
            return true
        }
    }
    
    private static func isNumber(_ input: Character) -> Bool {
        return input.isNumber
    }
    
    private static func isNumberSymbol(_ input: Character) -> Bool {
        let numberSymbolArray: [Character] = [".", "-"]
        
        return numberSymbolArray.contains(input)
    }
}
