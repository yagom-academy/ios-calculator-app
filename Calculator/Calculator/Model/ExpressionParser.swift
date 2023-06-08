//
//  ExpressionParser.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/04.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        try componentsByOperators(from: input).forEach { operand in
            guard let doubleOperand = Double(operand) else {
                throw ExpressionParserError.operandConvertError
            }
            
            operandsQueue.enqueue(doubleOperand)
        }
        
        input.map { $0 }.forEach {
            if let `operator` = Operator(rawValue: $0) {
                operatorsQueue.enqueue(`operator`)
            }
        }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
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
