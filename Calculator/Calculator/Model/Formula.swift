import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0}
        
        while !operands.isEmpty {
            guard let rhs = operands.dequeue() else { return result }
            guard let pickedOperation = operations.dequeue() else { return result }
            result = pickedOperation.calcuate(lhs: result, rhs: rhs)
        }
        return result
    }
}
