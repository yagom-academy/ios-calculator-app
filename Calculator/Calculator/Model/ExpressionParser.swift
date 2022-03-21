import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formulaArray = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operationQueue = CalculatorItemQueue<Operator>()
        for element in formulaArray {
            if let number = Double(element) {
                operandQueue.enqueue(number)
            } else {
                for op in Operator.allCases {
                    if op.rawValue == Character(element) {
                        operationQueue.enqueue(op)
                    }
                }
            }
        }
        return Formula(operands: operandQueue, operations: operationQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
