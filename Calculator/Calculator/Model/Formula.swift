struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init(operands: [CalculateItem], operators: [CalculateItem]) {
        self.operands = CalculatorItemQueue(operands)
        self.operators = CalculatorItemQueue(operators)
    }
    
    init() {
        self.operands = CalculatorItemQueue()
        self.operators = CalculatorItemQueue()
    }
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() as? Double else {
            return 0
        }
        
        while let `operator` = operators.dequeue() as? Operator,
              let operand = operands.dequeue() as? Double{
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}
