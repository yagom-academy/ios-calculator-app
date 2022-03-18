//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation
// input String = "1 + 2 - -3"
enum ExpressionParser {
    func parse(from input: String) -> Formula {
        var formula = Formula()
        componentsByOperator(from: input) // ["1", "+", "2", "-", "-3"]
            .compactMap{ Double($0) } // [1, 2, -3]
            .forEach{ formula.operands.enqueue($0) } // enqueue [1, 2, -3]
        componentsByOperator(from: input) // ["1", "+", "2", "-", "-3"]
            .filter{ Double($0) == nil } // ["+", "-"]
            .compactMap{ Operator(rawValue: Character($0)) } // [.add, .subtract]
            .forEach{ formula.operators.enqueue($0) } //dequeue [.add, .subtract]
        return formula
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
