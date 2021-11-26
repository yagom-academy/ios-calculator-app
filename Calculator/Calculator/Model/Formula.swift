import Foundation

struct Formula {
    let operands = CalculatorItemQueue<Double>()
    let operators = CalculatorItemQueue<Operator>()
    
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
