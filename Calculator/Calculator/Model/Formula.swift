struct Formula {
    private(set) var operandsQueue = CalculatorItemQueue()
    private(set) var operatorsQueue = CalculatorItemQueue()
    
    mutating func enqueueToOperandsQueue(_ item: Double) {
        operandsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperandsQueue() -> CalculateItem? {
        return operandsQueue.dequeue()
    }
    
    mutating func enqueueToOperatorsQueue(_ item: Operator) {
        operatorsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperatorsQueue() -> CalculateItem? {
        return operatorsQueue.dequeue()
    }

    func result() -> Double {
        let operands: [Double] = operandsQueue.allOperands()
        let operators: [Operator] = operatorsQueue.allOperators()
        
        guard var result = operands.first else {
            return 0
        }
        
        for (index, `operator`) in operators.enumerated() {
            guard index+1 < operands.count else { break }
            
            let operand = operands[index+1]
            result = `operator`.calculate(lhs: result, rhs: operand)
        }

        return result
    }
}
