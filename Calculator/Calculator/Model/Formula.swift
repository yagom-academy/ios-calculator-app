struct Formula {
    private(set) var operandsQueue = CalculatorItemQueue<Double>()
    private(set) var operatorsQueue = CalculatorItemQueue<Operator>()
    
    mutating func enqueueToOperandsQueue(_ item: Double) {
        operandsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperandsQueue() -> Double? {
        return operandsQueue.dequeue() as? Double
    }
    
    mutating func enqueueToOperatorsQueue(_ item: Operator) {
        operatorsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperatorsQueue() -> Operator? {
        return operatorsQueue.dequeue() as? Operator
    }

    mutating func result() -> Double {
        guard var result = dequeueFromOperandsQueue() else {
            return 0
        }
        
        while let `operator` = dequeueFromOperatorsQueue(),
              let operand = dequeueFromOperandsQueue() {
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
