import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() -> Double {
        var result: Double
        guard let removedOperand = operands.dequeue() else { return 0.0 } // throw 처리 필요
        
        result = operators.scanAllValues().reduce(removedOperand) { 
            guard let nextOperand = operands.dequeue() else { return 0.0 } // throw 처리 필요
            return $1.calculate(lhs: $0, rhs: nextOperand)
        }
        
        return result
    }
}
