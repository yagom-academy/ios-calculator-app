struct Formula {
    var operandQueue: CalculatorItemQueue<Double>
    var operatorQueue: CalculatorItemQueue<Operator>
    
    init(operands: [Double], operators:[Operator]) {
        self.operandQueue = CalculatorItemQueue(operands)
        self.operatorQueue = CalculatorItemQueue(operators)
    }
    
    init() {
        self.operandQueue = CalculatorItemQueue<Double>()
        self.operatorQueue = CalculatorItemQueue<Operator>()
    }
    
    mutating func result() throws -> Double {
        var result = try operandQueue.dequeue()
        
        while operatorQueue.isEmpty == false {
            let `operator` = try operatorQueue.dequeue()
            let operand = try operandQueue.dequeue()
            result = try `operator`.calculate(lhs: result, rhs: operand)
        }
        return result
    }
}
