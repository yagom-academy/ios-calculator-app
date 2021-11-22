struct Formula {
    private(set) var operandsQueue = CalculatorItemQueue<Double>()
    private(set) var operatorsQueue = CalculatorItemQueue<Operator>()
    
    mutating func enqueueToOperandsQueue(_ item: Double) {
        operandsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperandsQueue() -> Double? {
        return operandsQueue.dequeue()
    }
    
    mutating func enqueueToOperatorsQueue(_ item: Operator) {
        operatorsQueue.enqueue(item)
    }
    
    mutating func dequeueFromOperatorsQueue() -> Operator? {
        return operatorsQueue.dequeue()
    }

    mutating func result() throws -> Double {
        guard let removedOperand = operandsQueue.dequeue() else {
            throw CalculatorError.queueIsEmpty
        }
        
        let result: Double = try operatorsQueue.allItems().reduce(removedOperand) {
            guard let nextOperand = operandsQueue.dequeue() else {
                throw CalculatorError.queueIsEmpty
            }
            
            return try $1.calculate(lhs: $0, rhs: nextOperand)
        }
        
        return result
    }
}
