//  Created by bella on 2022/09/22.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let firstNumber = operands.dequeue() else { return 0 }
        var result: Double = firstNumber
        
        while operands.count() > 0 {
            guard let operatorSymbol = operators.dequeue() else { return 0 }
            if let nextNumber = operands.dequeue() {
                result = operatorSymbol.calculate(lhs: result, rhs: nextNumber)
            }
        }
        return result
    }
}
