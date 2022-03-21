import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0}
        while !operands.isEmpty {
            guard let rhs = operands.dequeue() else { return result }
            let pickedOperation = operations.dequeue()
            for op in Operator.allCases {
                if pickedOperation == op {
                    result = op.calcuate(lhs: result, rhs: rhs)
                }
            }
        }
        return result
    }
}
