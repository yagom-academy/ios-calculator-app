
import Foundation

struct Formula {
    var operators: CalculatorItemQueue<Operator>
    var operands: CalculatorItemQueue<Double>
    
    init(operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(), operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()) {
        self.operators = operators
        self.operands = operands
    }
    
    mutating func result() throws -> Double {
        var result = try operands.dequeue()
        
        while operators.isEmpty == false {
            let `operator` = try operators.dequeue()
            
            let operand = try operands.dequeue()
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}

