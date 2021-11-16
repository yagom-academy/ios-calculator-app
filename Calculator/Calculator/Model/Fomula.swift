
import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var oprators = CalculatorItemQueue<Operator.RawValue>()
    let operations = Operator.allCases.map{ $0.rawValue }
    
    func result() throws -> Double {
        var value = 0.0
        
        while !oprators.linkedList.isEmpty {
            do {
                let eachOperation = try oprators.linkedList.dequeueWithData()
                let firstOperand = try operands.linkedList.dequeueWithData()
                let secondOperand = try operands.linkedList.dequeueWithData()
                guard let currentNumber = Operator(rawValue: eachOperation)?.calculate(lhs: firstOperand, rhs: secondOperand) else {
                    throw QueueError.EmptyInLinkedList
                }
                value += currentNumber
            } catch QueueError.EmptyInLinkedList {
                return 0.0
            }
        }
        return value
    }
}
