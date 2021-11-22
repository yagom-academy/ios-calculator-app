import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands:CalculatorItemQueue<Double> = CalculatorItemQueue<Double>(calculatorItems: []), operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(calculatorItems: [.add])) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        var result: Double = 0
        while operands.numberOfItems > 0 {
            let lhs = result
            guard let rhs = operands.dequeue() else { return 0 }
            
            guard let `operator` = operators.dequeue() else {return 0}
            do {
                let calculateResult = try `operator`.calculate(lhs: lhs, rhs: rhs)
                result = calculateResult
            } catch {
                print("0으로 나눌 수 없음")
            }
        }
        
        return result
    }
}
