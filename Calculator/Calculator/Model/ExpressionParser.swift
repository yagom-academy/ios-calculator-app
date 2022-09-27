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
        var temp = ""
 
        for element in input {
            switch element {
            case "+" :
                guard let doubleTemp = Double(temp) else {
                    throw FormulaError.notValidCountQueue
                }
                operands.enqueue(doubleTemp)
                operators.enqueue(Operator.add)
                temp = ""
            case "-" :
                guard let doubleTemp = Double(temp) else {
                    throw FormulaError.notValidCountQueue
                }
                operands.enqueue(doubleTemp)
                operators.enqueue(Operator.subtract)
                temp = ""
            case "*" :
                guard let doubleTemp = Double(temp) else {
                    throw FormulaError.notValidCountQueue
                }
                operands.enqueue(doubleTemp)
                operators.enqueue(Operator.multiply)
                temp = ""
            case "/" :
                guard let doubleTemp = Double(temp) else {
                    throw FormulaError.notValidCountQueue
                }
                operands.enqueue(doubleTemp)
                operators.enqueue(Operator.divide)
                temp = ""
            default:
                temp += String(element)
            }
        }
        
        guard let doubleTemp = Double(temp) else {
            throw FormulaError.notValidCountQueue
        }
        operands.enqueue(doubleTemp)
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return [input]
    }
}
