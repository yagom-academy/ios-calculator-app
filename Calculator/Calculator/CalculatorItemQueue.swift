struct CalculatorItemQueue<Element: CalculateItem> {

    private(set) var enqueueStack: [Element] = []
    private(set) var dequeueStack: [Element] = []
    
    mutating func enqueue(element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
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
    
    func peek() -> Element? {
        if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
    
}
