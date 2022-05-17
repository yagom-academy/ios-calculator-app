struct CalculatorItemQueue<Item> {
    private(set) var calulatorItems: [Item] = []
    private var head = 0
    
    mutating func enqueue(element: Item) {
        calulatorItems.append(element)
    }
    
    mutating func dequeue() -> Item? {
        if calulatorItems.isEmpty {
            return nil
        }
        
        let element = calulatorItems[head]
        head += 1
        
        return element
    }
    
    func isEmpty() -> Bool {
        return calulatorItems.isEmpty
    }
}

extension Double: CalculatorItem {
    
}
