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
        //0.components만큼 반복
        //1. Double로 변환될 때 operands 할당 후 enqueue
        //2. Character로 변환될 때 (Operator타입일 때) operators 할당 후 enqueue
        var formula: Formula = Formula()
        
        components.forEach { component in
            if let operandElement = Double(component) {
                formula.operands.enqueue(operandElement)
            }
            if let operatorElement = Operator(rawValue: Character(component)) {
                formula.operators.enqueue(operatorElement)
            }
        }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.components(separatedBy: String(operatorCase.rawValue)) }
        }
        
        return result
    }
}
