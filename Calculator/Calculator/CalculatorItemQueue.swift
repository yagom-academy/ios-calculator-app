struct CalculatorItemQueue<T>: CalculateItem {

    private var queue: [T] = []
    
    mutating func enqueue(element: T) {
        queue.append(element)
    }
    
    mutating func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func dequeue() -> T? {
        return isEmpty() ? nil : queue.removeFirst()
    }

    mutating func clearQueue() {
        queue.removeAll()
    }
    
    mutating func searchQueue() -> T? {
        return queue.first
    }
    
}
