import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var sumTotal = operands.dequeue() else {
            return 0
        }
        
        while !(operands.isEmpty) {
            guard let operand = operands.dequeue(), let `operator` = operators.dequeue() else {
                return 0
            }
            
            sumTotal = `operator`.calculate(lhs: sumTotal, rhs: operand)
            
            if sumTotal.isNaN { break }
        }
        
        return sumTotal
    }
}
