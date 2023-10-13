//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>(list: LinkedList())
        let operators = CalculatorItemQueue<Operator>(list: LinkedList())
        let components = componentsByOperator(from: input)
        
        components.compactMap{ Double($0) }.forEach {
            operands.enQueue($0)
        }
        
        input.compactMap{ Operator(rawValue: $0) }.forEach {
            operators.enQueue($0)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        let operatorList = Operator.allCases
        var splitedString = [input.filter { $0 != " " }]
        
        operatorList.forEach { `operator` in
            splitedString = splitedString.flatMap{ $0.split(with:`operator`.rawValue) }
        }
        
        return splitedString
    }
}
