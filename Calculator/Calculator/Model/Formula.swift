struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var calculateResult: Double = operands.dequeue() else {
            return .zero
        }
        
        while !operators.isEmpty || !operands.isEmpty {
            guard let currentOperator: Operator = operators.dequeue(),
                  let number: Double = operands.dequeue() else {
                return .zero
            }

            calculateResult = currentOperator.calculate(calculateResult, number)
        }
        
        return calculateResult
    }
}
