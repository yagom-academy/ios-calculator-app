struct CalculatorItemQueue<dataType: CalculateItem> {

    private(set) var enqueueStack: [dataType] = []
    private(set) var dequeueStack: [dataType] = []
    
    mutating func enqueue(element: dataType) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> dataType? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    func isEmpty() -> Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    func peek() -> dataType? {
        if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
    
}
