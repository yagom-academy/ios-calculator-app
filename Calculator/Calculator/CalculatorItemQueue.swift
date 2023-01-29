struct CalculatorItemQueue<dataType>: CalculateItem {

    private var queue: [dataType] = []
    
    mutating func enqueue(element: dataType) {
        queue.append(element)
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func dequeue() -> dataType? {
        return isEmpty() ? nil : queue.removeFirst()
    }

    mutating func clearQueue() {
        queue.removeAll()
    }
    
    func peek() {
        
    }
    
}

var a = CalculatorItemQueue<Int>()
