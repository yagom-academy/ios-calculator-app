struct CalculatorItemQueue {
    var queue: [Int] = []
    
    mutating func enqueue(element: Int) {
        queue.append(element)
    }
}
