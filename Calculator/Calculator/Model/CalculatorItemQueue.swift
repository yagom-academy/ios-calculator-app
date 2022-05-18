struct CalculatorItemQueue<Item: CalculatorItem> {
    private var enqueueItems: [Item] = []
    private var dequeueItems: [Item] = []
    var calculatorItems: [Item] {
        get {
            return dequeueItems.reversed() + enqueueItems
        }
    }
    var isEmpty: Bool {
        return enqueueItems.isEmpty && dequeueItems.isEmpty
    }
    
    mutating func enqueue(_ element: Item) {
        enqueueItems.append(element)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty else { return nil }
        
        if dequeueItems.isEmpty {
            dequeueItems = enqueueItems.reversed()
            enqueueItems.removeAll()
        }

        return dequeueItems.popLast()
    }
}
