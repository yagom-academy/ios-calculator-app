import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double? {
        var result: Double = 0
        for _ in 0...`operands`.countItems()-1 {
            let lhs = result
            guard let rhs = operands.dequeue() else { return nil }
            
            let `operator` = operators.dequeue()
            guard let calculateResult = `operator`?.calculate(lhs: lhs, rhs: rhs) else { return nil }
            result = calculateResult
        }
        
        print(result)
        return result
    }
}
