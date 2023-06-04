//
//  StubExpressionParser.swift
//  ExpressionParserTests
//
//  Created by EtialMoon on 2023/06/04.
//

@testable import Calculator

struct StubExpressionParser {
    func componentsByOperators(from input: String) -> [String] {
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

