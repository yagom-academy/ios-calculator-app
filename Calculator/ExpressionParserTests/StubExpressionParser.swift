//
//  StubExpressionParser.swift
//  ExpressionParserTests
//
//  Created by EtialMoon on 2023/06/04.
//

@testable import Calculator

struct StubExpressionParser {
    func parse(from input: String) throws -> Formula {
        let operands = componentsByOperators(from: input)
        var operators = [input]
        var formula = Formula()
        
        operands.forEach { operand in
            var splitOperators: [String] = []
            
            operators.forEach { element in
                let separatedElement = element.split(separator: operand).map{ String($0) }
                splitOperators.append(contentsOf: separatedElement)
            }
            
            operators = splitOperators
        }
        
        try operands.forEach { operand in
            guard let operand = Double(operand) else {
                throw ExpressionParserError.operandConvertError
            }
            
            formula.operands.enqueue(operand)
        }
        
        try operators.forEach { `operator` in
            guard let `operator` = Operator(rawValue: Character(`operator`)) else {
                throw ExpressionParserError.operatorConvertError
            }
            
            formula.operators.enqueue(`operator`)
        }
        
        return formula
    }
    
    func componentsByOperators(from input: String) -> [String] {
        var result = [input]

        Operator.allCases.forEach { `operator` in
            var splitResult: [String] = []
            
            result.forEach { element in
                let separatedElement = element.split(with: `operator`.rawValue)
                
                splitResult.append(contentsOf: separatedElement)
            }
            
            result = splitResult
        }
        
        return result
    }
}
