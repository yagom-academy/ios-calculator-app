//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var calculateFormula: Formula = Formula()

        componentsByOperators(from: input).forEach { (component: String) -> () in
           guard let number = Double(component) else {
                return
            }

            calculateFormula.operands.enqueue(operation: number)
        }
        
        let operators: [Character] = input.filter { (`operator`: Character) -> Bool in
            return "+/*₋".contains(`operator`)
        }
     
        operators.forEach { (`operator`: Character) -> () in
            guard let arithmetic = Operator(rawValue: `operator`) else {
                return
            }
            
            calculateFormula.operators.enqueue(operation: arithmetic)
        }
        
        return calculateFormula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var resultOfReplacing: String = " "
        for operation in Operator.allCases {
            resultOfReplacing = input.replacingOccurrences(of: String(operation.rawValue), with: " ")
        }
   
        return resultOfReplacing.split(with: " ")
    }
}
