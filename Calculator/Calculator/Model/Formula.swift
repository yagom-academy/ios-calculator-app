
import Foundation

struct Formula {
    public var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    public var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    public mutating func result() throws -> Double {
        var result: Double = 0.0
        
        guard let firstNumber = operands.dequeue() else { return 0.0 }
        result = firstNumber
        
        while operators.count > 0 {
            guard let operandItem: Double = operands.dequeue() else { return 0.0 }
            guard let operatorItem: Operator = operators.dequeue() else { return 0.0 }
            
            do {
                try result = operatorItem.calculate(lhs: result, rhs: operandItem)
            } catch _ as CalculatorError {
                break
            }
        }
        
        return result
    }
}
