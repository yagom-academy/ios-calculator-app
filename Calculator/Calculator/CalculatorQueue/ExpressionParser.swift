//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/20.
//
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsQueue = CalculatorItemQueue()
        let operatorQueue = CalculatorItemQueue()
        let formula = Formula(operands: operandsQueue, operators: operatorQueue)
        let operators: [String] = componentsByOperators(from: input)
        let operands: [Double] = input.split(with: " ").filter {
            !operators.contains($0)
        }.map {
            Double($0) ?? 0
        }
        
        operators.map{
            Character($0)
        }.forEach {
            guard let calcOperator = Operator(rawValue: $0) else {
                return
            }
            formula.operators.enQueue(calcOperator)
        }
        operands.forEach {
            formula.operands.enQueue($0)
        }
        
        return formula
    }
    static private func componentsByOperators(from input: String) -> [String] {
        let operatorList = Operator.allCases.map {
            String($0.rawValue)
        }
        let components = input.components(separatedBy: " ")
        return components.filter {
            operatorList.contains(String($0))
        }.map {
            String($0)
        }
    }
}
