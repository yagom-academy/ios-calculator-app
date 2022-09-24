struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        guard var calculateResult: Double = operands.dequeue() else {
            fatalError()
        }
        while !operators.isEmpty {
            guard let currentOperator: Operator = operators.dequeue(),
                  let number: Double = operands.dequeue() else {
                fatalError()
            }
            calculateResult = currentOperator.calculate(calculateResult, number)
        }
        
        return calculateResult
    }
}
