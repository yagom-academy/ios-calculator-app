//
//  ExpressionParser.swift
//  Calculator
//
//  Created by karen on 2023/06/13.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
        
        input.filter{ $0.isNumber == false }.compactMap{ Operator(rawValue: $0)}.forEach{ formula.operators.enqueue($0) }
        componentsByOperators(from: input).compactMap{ Double($0) }.forEach{ formula.operands.enqueue($0) }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: Character(" "))
    }
}
