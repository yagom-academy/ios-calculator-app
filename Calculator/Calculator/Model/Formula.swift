struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() -> Double {
        guard var sum = operands.dequeue() else { return .zero }
        if operands.isEmpty {
            guard let initialOperator = operators.dequeue() else { return .zero }
            return initialOperator.calculate(lhs: 0, rhs: sum)
        }
        
        while let nextValue = operands.dequeue(),
              let `operator` = operators.dequeue() {
            sum = `operator`.calculate(lhs: sum, rhs: nextValue)
        }
        return sum
    }
}

