// Formula: 공식
struct Formula {
    var operands = CalculatorItemQueue<Double>()    // 피연산자
    var operators = CalculatorItemQueue<Operator>()   // 연산자
    
    
    mutating func result() -> Double {
        var result: Double = 0
        
        while !operands.isEmpty {
            if let prev = operands.dequeue(), let next = operands.dequeue(), let `operator` = operators.dequeue() {
                result = `operator`.calculate(lhs:prev ,rhs: next)
            }
        }
        
        return result
    }
    
}
