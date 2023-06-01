//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let allOperators = Operator.allCases.map { $0.rawValue }
        var operatorsQueue = CalculatorItemQueue()
        var operandsQueue = CalculatorItemQueue()
        let operatorWithMinus = [(before: "+-", after: "+!"),
                                 (before: "--", after: "-!"),
                                 (before: "/-", after: "/!"),
                                 (before: "*-", after: "*!")]
        let inputValue = operatorWithMinus.reduce(input) { inputString, operatorType in
            inputString.replacingOccurrences(of: operatorType.before, with: operatorType.after)
        }
        let inputOperators = inputValue.filter { allOperators.contains($0) }
        inputOperators.forEach { operatorsQueue.enqueue(String($0)) }
        let inputSplited = self.componentsByOperators(from: inputValue)
        
        for value in inputSplited {
            guard let valueDouble = Double(value) else {
                throw CalculatorError.invalidInput
            }
            operandsQueue.enqueue(valueDouble)
        }
        return Formula(operands:operandsQueue, operators: operatorsQueue)
    }
        
    static private func componentsByOperators(from input: String) -> [String] {
        let allOperators = Operator.allCases.map { $0.rawValue }
        
        var inputValues = allOperators.reduce(input) { inputString, operatorType in
            inputString.split(with: operatorType).joined(separator: "|")
        }
        inputValues = inputValues.replacingOccurrences(of: "!", with: "-")
        let result = inputValues.split(with: "|")
        return result
    }
}
