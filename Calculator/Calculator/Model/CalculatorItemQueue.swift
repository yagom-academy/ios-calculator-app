struct CalculatorItemQueue {
    var queue: [CalculatorItem] = []
    var head = 0
    
    mutating func enqueue(element: CalculatorItem) {
        queue.append(element)
    }
    
    mutating func dequeue() -> CalculatorItem? {
        if queue.isEmpty {
            return nil
        }
        
        let element = queue[head]
        head += 1
        
        return element
    }
}

extension Double: CalculatorItem {
    
}
