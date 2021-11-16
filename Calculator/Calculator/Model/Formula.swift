struct Formula {
    var operandQueue: CalculatorItemQueue
    var operatorQueue: CalculatorItemQueue
    
    init(operands: [CalculateItem], operators: [CalculateItem]) {
        self.operandQueue = CalculatorItemQueue(operands)
        self.operatorQueue = CalculatorItemQueue(operators)
    }
    
    init() {
        self.operandQueue = CalculatorItemQueue()
        self.operatorQueue = CalculatorItemQueue()
    }
    
    mutating func result() throws -> Double {
        guard var result = operandQueue.dequeue() as? Double else {
            return 0
        }
        
        while let `operator` = operatorQueue.dequeue() as? Operator,
              let operand = operandQueue.dequeue() as? Double{
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}
