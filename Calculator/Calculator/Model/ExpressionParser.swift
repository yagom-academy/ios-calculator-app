import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formulaArray = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operationQueue = CalculatorItemQueue<Operator>()

        for element in formulaArray {
            if let number = Double(element) {
                operandQueue.enqueue(number)
                continue
            }
            if let operation = Operator(rawValue: Character(element)) {
                operationQueue.enqueue(operation)
            }
        }
        return Formula(operands: operandQueue, operations: operationQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
