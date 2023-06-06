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
        var operandCandidates = componentsByOperators(from: input)
        
        for index in 0..<operandCandidates.count - 1 {
            if operandCandidates[index].isEmpty {
                operandCandidates[index + 1] = "-\(operandCandidates[index + 1])"
            }
        }
            
        var operands = operandCandidates.compactMap { Double($0) }
        let operatorCandidates: String = input.hasPrefix("-") ? String(input.suffix(from: input.index(input.startIndex, offsetBy: 1))) : input
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
        return Operator.allCases.reduce([input]) { splitedInput, `operator` in
            splitedInput.map { $0.split(with: `operator`.rawValue) }.flatMap { $0 }
        }
    }
}
