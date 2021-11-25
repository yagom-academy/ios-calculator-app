import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var calculatedResult = operands.dequeue() else { return 0.0 }

        while let nextOperator = operators.dequeue(),
              let nextOperand = operands.dequeue() {
            calculatedResult = nextOperator.calculate(lhs: calculatedResult,
                                                      rhs: nextOperand)
            }
        
        return calculatedResult
    }
}
