//
//  ExpressionParser.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}

enum Expressionparser {
    static func parse(from input: String) -> Formula {
        let components: [String] = componentsByOperators(from: input)
//        let operands: [Double] = components.compactMap { Double($0) }
//        let operators: [Operator] = components.compactMap { Operator(rawValue: Character($0)) }
//
        var formula: Formula = Formula()
        for i in 1...components.count {
            if let component = Double(components[i]) {
                formula.operands.enqueue(Double(components[i]) ?? <#default value#>)
            } else {
                formula.operators.enqueue(components[Operator(rawValue: i)])
            }
        }
        return
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.components(separatedBy: String(operatorCase.rawValue)) }
        }
        
        return result
    }
}
