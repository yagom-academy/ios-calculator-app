struct CalculatorItemQueue {
    var queue: [Int] = []
    var head = 0
    
    mutating func enqueue(element: Int) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if queue.isEmpty {
            return nil
        }
        
        let element = queue[head]
        head += 1
        
        return element
    }
}
