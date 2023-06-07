//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula(operands: CalculatorItemQueue<Double>(),
                                       operators: CalculatorItemQueue<Operator>())
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorCandidates: String = String(input.suffix(input.count - 1))
        let operators = operatorCandidates
            .replacingOccurrences(of: "+-", with: "+")
            .replacingOccurrences(of: "--", with: "-")
            .replacingOccurrences(of: "/-", with: "/")
            .replacingOccurrences(of: "*-", with: "*")
            .compactMap { Operator(rawValue: $0) }
        
        operands.forEach { formula.operands.enqueue($0) }
        operators.forEach { formula.operators.enqueue($0) }

        return formula
    }
        
    static private func componentsByOperators(from input: String) -> [String] {
        var operands: [String] = Operator.allCases.reduce([input]) { splitInput, operatorCase in
            splitInput.map { $0.split(with: operatorCase.rawValue) }.flatMap { $0 }
        }
        
        for index in 0..<operands.count - 1 {
            if operands[index].isEmpty {
                operands[index + 1] = "-\(operands[index + 1])"
            }
        }
        
        return operands
    }
}
