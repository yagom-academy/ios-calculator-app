struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
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
