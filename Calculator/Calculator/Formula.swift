//  Created by bella on 2022/09/22.

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0
        guard let firstNumber = operands.dequeue(),
              let operatorSymbol = operators.dequeue(),
              let secondNumber = operands.dequeue() else { return 0 }
        result = operatorSymbol.calculate(lhs: firstNumber, rhs: secondNumber)
        
        while operands.count() > 0 && operators.count() > 0 {
            guard let extratNumber = operands.dequeue() else { return 0 }
            if let extraOperatorSymbol = operators.dequeue() {
                result = extraOperatorSymbol.calculate(lhs: result, rhs: extratNumber)
            }
        }
        return result
    }
}
