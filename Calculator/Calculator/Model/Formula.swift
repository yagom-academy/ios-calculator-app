import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var sumTotal = operands.dequeue() else {
            return 0
        }
        
        while !(operands.isEmpty && operators.isEmpty) {
            guard let operand = operands.dequeue(), let `operator` = operators.dequeue() else {
                return 0
            }
            
            guard !(sumTotal.isNaN) else {
                break
            }
            
            sumTotal = `operator`.calculate(lhs: sumTotal, rhs: operand)
        }
        
        return sumTotal
    }
}
