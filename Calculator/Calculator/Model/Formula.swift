struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        var calculateResult = operands.dequeue() ?? 0
        
        while true {
            guard let opr = operators.dequeue(), let number = operands.dequeue() else { break }
                
            calculateResult = try opr.calculate(lhs: calculateResult, rhs: number)
        }
        
        return calculateResult
    }
}
