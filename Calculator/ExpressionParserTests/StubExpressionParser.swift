//
//  StubExpressionParser.swift
//  ExpressionParserTests
//
//  Created by EtialMoon on 2023/06/04.
//

@testable import Calculator
import Foundation

struct StubExpressionParser {
    var operandsQueue = CalculatorItemQueue<Double>()
    var operatorsQueue = CalculatorItemQueue<Operator>()
    
    @discardableResult
    mutating func parse(from input: String) throws -> Formula {
        var inputSplitedByOperands = [input]
        
        try componentsByOperators(from: input).forEach { operand in
            guard let doubleOperand = Double(operand) else {
                throw ExpressionParserError.operandConvertError
            }
            
            operandsQueue.enqueue(doubleOperand)
            
            var splitedOperators: [String] = []
            
            inputSplitedByOperands.forEach { element in
                let separatedElement = element.split(separator: operand).map{ String($0) }
                splitedOperators.append(contentsOf: separatedElement)
            }
            
            inputSplitedByOperands = splitedOperators
        }
        
        try inputSplitedByOperands.forEach { `operator` in
            guard let `operator` = Operator(rawValue: Character(`operator`)) else {
                throw ExpressionParserError.operatorConvertError
            }
            
            operatorsQueue.enqueue(`operator`)
        }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
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
