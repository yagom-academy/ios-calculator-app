import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    init(operands:CalculatorItemQueue<Double> = CalculatorItemQueue<Double>(calculatorItems: []), operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>(calculatorItems: [])) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double? {
        var result: Double = 0
        for _ in 0...operands.countItems()-1 {
            let lhs = result
            guard let rhs = operands.dequeue() else { return nil }
            
            let `operator` = operators.dequeue()
            do {
                let calculateResult =  try `operator`?.calculate(lhs: lhs, rhs: rhs)
                result = calculateResult ?? 0
            } catch {
                print("0으로 나눌 수 없음")
            }
        }
        
        return result
    }
}
