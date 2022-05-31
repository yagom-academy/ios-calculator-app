//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let stringTypeOperators = componentByOperators(from: input)
        let operands = input.split { stringTypeOperators.contains(String($0)) }.compactMap { Double($0) }
        let operators = stringTypeOperators.compactMap { Operator(rawValue: $0) }
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        operators.forEach { operatorsQueue.queue.enqueue($0) }
        operands.forEach { operandsQueue.queue.enqueue($0) }
        
        return Formula(operand: operandsQueue, operator: operatorsQueue)
    }
    
    static private func componentByOperators(from input: String) -> [String] {
        let operators = input.filter { self.isOperator($0) }.map { String($0) }
        
        return operators
    }

    private static func isOperator(_ input: Character) -> Bool {
        guard !self.isNumber(input) && !self.isNumberSymbol(input) else {
            return false
        }
        
        return true
    }
    
    private static func isNumber(_ input: Character) -> Bool {
        return input.isNumber
    }
    
    private static func isNumberSymbol(_ input: Character) -> Bool {
        let numberSymbolArray: [Character] = [".", "-"]
        
        return numberSymbolArray.contains(input)
    }
}
