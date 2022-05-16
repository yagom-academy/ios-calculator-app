struct CalculatorItemQueue {
    var queue: [Int] = []

    mutating func enqueue(element: Int) {
        queue.append(element)
    }
    
    func dequeue() -> Int {
        return queue[0]
    }
}
