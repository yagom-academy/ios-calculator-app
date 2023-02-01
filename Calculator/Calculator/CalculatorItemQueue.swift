struct CalculatorItemQueue< Element: CalculateItem > {

    private(set) var enqueueStack: [Element] = []
    private(set) var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var peek: Element? {
        if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
    
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
    
    
    
}
