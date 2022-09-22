//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operands: CalculatorItemQueue<Double> = .init()
        var operators: CalculatorItemQueue<Operator> = .init()
        let numbers: [Double] = componentsByOperators(from: input).compactMap{
            Double($0)
        }
        let calculateSigns: [Operator] = input.compactMap{
            Operator(rawValue: $0)
        }
        numbers.forEach{
            operands.enqueue($0)
        }
        calculateSigns.forEach{
            operators.enqueue($0)
        }
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let separator: String = String(Operator.allCases.map{
            $0.rawValue
        })
        return input.components(separatedBy: CharacterSet(charactersIn: separator)).filter{
            $0 != ""
        }
    }
}
