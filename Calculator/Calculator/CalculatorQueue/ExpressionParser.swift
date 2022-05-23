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
        let operators: [Character] = componentsByOperators(from: input).map { op in
            Character(op)
        }
        let operands: [Double] = input.split {
            operators.contains($0)
        }.map {
            Double($0) ?? 0.0
        }
        operators.forEach {
            guard let operators = Operator.init(rawValue: $0) else {
                return
            }
            formula.operators.enQueue(operators)
        }
        operands.forEach {
            formula.operands.enQueue($0)
        }
        return formula
    }
    static private func componentsByOperators(from input: String) -> [String] {
        let operatorList = Operator.allCases.map {
            "\(String($0.rawValue))"
        }
        return input.filter {
            operatorList.contains(String($0)) == true
        }.map {
            String($0)
        }
    }
}
