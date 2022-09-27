//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//
    
enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operands = CalculatorItemQueue()
        var operators = CalculatorItemQueue()
        var beforeDoubleValue = ""
        
        func enqueueOperand(and `operator`: Operator) throws {
            guard let changingDouble = Double(beforeDoubleValue) else {
                throw ExpressionParserError.doNotChangeDouble
            }
            operands.enqueue(changingDouble)
            operators.enqueue(`operator`)
            beforeDoubleValue = ""
        }
        
        for element in input {
            switch element {
            case "+" :
                try enqueueOperand(and: .add)
            case "-" :
                try enqueueOperand(and: .subtract)
            case "*" :
                try enqueueOperand(and: .multiply)
            case "/" :
                try enqueueOperand(and: .divide)
            default:
                beforeDoubleValue += String(element)
            }
        }
        
        guard let changingDouble = Double(beforeDoubleValue) else {
            throw ExpressionParserError.doNotChangeDouble
        }
        operands.enqueue(changingDouble)
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return [input]
    }
}
