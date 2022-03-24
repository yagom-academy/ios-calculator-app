
import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var result = operands.dequeue() ?? 0
        
        while operands.count != 0 {
            guard let operand = operands.dequeue(), let `operator` = operators.dequeue() else {
                return result
            }
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}
