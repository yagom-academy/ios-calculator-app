struct Formula {
    private (set) var operands = CalculatorItemQueue<Double>()
    private (set) var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var resultValue = operands.dequeue() else {
            return Double.zero
        }
        
        while !operands.isEmpty {
            if let operatorElement = operators.dequeue(), let next = operands.dequeue(){
                resultValue = operatorElement.calculate(lhs: resultValue, rhs: next)
            }
        }
        return resultValue
    }
    
}
