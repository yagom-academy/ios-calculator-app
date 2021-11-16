//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let OperatorsOfInputString = componentsByOperators(from: input)
        let operandsOfInputString = input.split(with: " ")
        
        OperatorsOfInputString.forEach {
            inputOperator in
                operators.enQueue(Operator(rawValue: Character(inputOperator)))
        }
        operandsOfInputString.compactMap { (operands: String) -> Double? in return Double(operands) }.forEach {
            inputOperand in operands.enQueue(inputOperand)
        }
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let availableOperators = Operator.allCases.map { (availableOperator: Operator) -> String in return  String(availableOperator.rawValue) }
        let operatorsOfInputString = input.split(with: " ")
            .filter{ (value: String) -> Bool in return availableOperators.contains(value) == true }
     
        return operatorsOfInputString
    }
}
