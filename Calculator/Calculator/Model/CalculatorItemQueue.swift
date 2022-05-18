struct CalculatorItemQueue<Item: CalculatorItem> {
    private(set) var enqueueStack: [Item] = []
    private(set) var dequeueStack: [Item] = []
    var calculatorItems: [Item] {
        get {
            return dequeueStack.reversed() + enqueueStack
        }
    }
    
    func isEmpty() -> Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: Item) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty() else { return nil }
        
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }

        return dequeueStack.popLast()
    }
}

