struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard var calculateResult: Double = operands.dequeue(),
              !operators.isEmpty else {
            throw FormulaError.emptyQueue
        }
        
        while !operators.isEmpty {
            guard let currentOperator: Operator = operators.dequeue(),
                  let number: Double = operands.dequeue() else {
                throw FormulaError.impossibleFormula
            }
            
            if currentOperator == .divide && number == Double(0) {
                throw FormulaError.indivisibleByZero
            }
            
            calculateResult = currentOperator.calculate(calculateResult, number)
        }
        
        if !operands.isEmpty {
            throw FormulaError.impossibleFormula
        }
        
        return calculateResult
    }
}
