struct CalculatorItemQueue<Item: CalculatorItem> {
    private(set) var enqueueStack = Stack<Item>()
    private(set) var dequeueStack = Stack<Item>()
    var calculatorItems: [Item] {
        get {
            return dequeueStack.stack.reversed() + enqueueStack.stack 
        }
    }
    
    func isEmpty() -> Bool {
        return enqueueStack.isEmpty() && dequeueStack.isEmpty()
    }
    
    mutating func enqueue(_ element: Item) {
        enqueueStack.enqueue(element)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty() else { return nil }
        
        if dequeueStack.isEmpty() {
            dequeueStack.stack = enqueueStack.stack.reversed()
            enqueueStack.stack.removeAll()
        }

        return dequeueStack.dequeue()
    }
}
