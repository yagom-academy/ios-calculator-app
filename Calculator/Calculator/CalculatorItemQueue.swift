struct CalculatorItemQueue<DataType: CalculateItem> {

    private(set) var enqueueStack: [DataType] = []
    private(set) var dequeueStack: [DataType] = []
    
    mutating func enqueue(element: DataType) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> DataType? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    mutating func clearQueue() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
    
    func isEmpty() -> Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    func peek() -> DataType? {
        if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
    
}
