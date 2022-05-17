struct CalculatorItemQueue<T>: CalculateItem {
    var calculateItems = [T]()
    
    mutating func enqueue(_ element: T) {
        calculateItems.append(element)
    }
    
    mutating func dequeue() -> T? {
        
        if calculateItems.isEmpty {
            return nil
        }
        return calculateItems.removeFirst()
    }
}
