import Foundation

enum ExpressionParser {
    public func parse(from input: String) -> Formula {
        var tempQueue: CalculatorItemQueue = CalculatorItemQueue<Int>()
        let formula = Formula(operands: tempQueue, operators: tempQueue)
        
        return formula
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
