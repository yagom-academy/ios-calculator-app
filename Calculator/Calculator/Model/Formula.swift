struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        var calculateResult = operands.dequeue() ?? 0
        
        while true {
            guard let opr = operators.dequeue(), let number = operands.dequeue() else { break }
                
            calculateResult = opr.calculate(lhs: calculateResult, rhs: number)
        }
        
        return calculateResult
    }
}
