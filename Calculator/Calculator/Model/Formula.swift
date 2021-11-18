import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double {
        guard let removedOperand = operands.dequeue() else {
            throw CalculatorError.queueIsEmpty
        }
        
        let result: Double = try operators.scanAllValues().reduce(removedOperand) {
            guard let nextOperand = operands.dequeue() else {
                throw CalculatorError.queueIsEmpty
            }
            
            return try $1.calculate(lhs: $0, rhs: nextOperand) // TODO: do-catch 구문 필요
        }
        
        return result
    }
}
