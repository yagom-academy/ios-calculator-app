struct CalculatorItemQueue {
    var queue: [Int] = []
    var count: Int {
        return queue.count
    }
    
    mutating func enqueue(element: Int) {
        queue.append(element)
    }
    
    func dequeue() -> Int {
        return queue[queue.count-1]
    }
}
