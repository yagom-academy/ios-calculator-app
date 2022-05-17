struct CalculatorItemQueue<Item> {
    private(set) var calulatorItems: [Item] = []
    private var head = 0
    
    func isEmpty() -> Bool {
        return calulatorItems.isEmpty
    }
    
    mutating func enqueue(_ element: Item) {
        calulatorItems.append(element)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty() else { return nil }
        
        let element = calulatorItems[head]
        head += 1
        
        return element
    }
}
