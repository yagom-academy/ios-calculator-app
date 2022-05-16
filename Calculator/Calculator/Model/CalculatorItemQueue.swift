struct CalculatorItemQueue<Item> {
    var calulatorItems: [Item] = []
    var head = 0
    
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
}

extension Double: CalculatorItem {
    
}
