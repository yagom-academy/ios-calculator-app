//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input)
        var operandsQueue = CalculatorItemQueue<Double>()
        
        for operand in operands {
            guard let number = Double(operand) else { break }
            operandsQueue.enqueue(number)
        }
        
        return Formula(operands: operandsQueue, operators: CalculatorItemQueue<Operator>())
    }
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = String(Operator.allCases.map { $0.rawValue })
        let operands = input.components(separatedBy: operators)
        return operands
    }
}
