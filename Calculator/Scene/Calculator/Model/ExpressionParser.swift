//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorOutline = componentByOperators(from: input)
        let operands: [Double] = input.split { operatorOutline.contains(String($0)) }.compactMap { Double($0) }
        let operators = operatorOutline.compactMap { Operator.init(rawValue: $0) }

        let formula = Formula(operand: operands, operator: operators)
        return formula
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
