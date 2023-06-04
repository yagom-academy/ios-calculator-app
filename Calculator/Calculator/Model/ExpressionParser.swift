//
//  ExpressionParser.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/04.
//

enum ExpressionParser {
    @available(iOS 16.0, *)
    static func parse(from input: String) throws -> Formula {
        let operands = componentsByOperators(from: input)
        var operators = [input]
        var formula = Formula()
        
        for operand in operands {
            var splitOperators: [String] = []
            
            operators.forEach { element in
                let separatedElement = element.split(separator: operand).map{ String($0) }
                splitOperators.append(contentsOf: separatedElement)
            }
            
            operators = splitOperators
        }
        
        for operand in operands {
            guard let operand = Double(operand) else {
                throw ExpressionParserError.operandConvertError
            }
            
            formula.operands.enqueue(operand)
        }
        
        for `operator` in operators {
            guard let `operator` = Operator(rawValue: Character(`operator`)) else {
                throw ExpressionParserError.operatorConvertError
            }
            
            formula.operators.enqueue(`operator`)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        var splitResult: [String] = []
        let operators =  Operator.allCases
        
        for `operator` in operators {
            result.forEach { element in
                let separatedElement = element.split(with: `operator`.rawValue)
                
                splitResult.append(contentsOf: separatedElement)
            }
            
            result = splitResult
            splitResult = []
        }
        
        return result
    }
}
