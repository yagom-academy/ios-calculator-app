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
        let operands: [Double] = input.split {
            operators.contains(String($0))
        }.map {
            Double($0) ?? 0.0
        }
        operators.forEach {
            switch $0 {
            case "+":
                formula.operators.enQueue(Operator.add)
            case "-":
                formula.operators.enQueue(Operator.substract)
            case "*":
                formula.operators.enQueue(Operator.multiply)
            case "/":
                formula.operators.enQueue(Operator.divide)
            default:
                break
            }
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
