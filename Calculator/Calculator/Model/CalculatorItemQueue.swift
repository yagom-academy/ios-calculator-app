struct CalculatorItemQueue<T>: CalculateItem {
    var calculateItems = [T]()
    
    mutating func enqueue(_ element: T) {
        calculateItems.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        
        return calculateItems.removeFirst()
    }
    
    mutating func resetQueue(){
        calculateItems.removeAll()
    }
    
    mutating func peak() -> T? {
        if isEmpty() {
            return nil
        }
        
        return calculateItems[0]
    }
    
    func isEmpty() -> Bool {
        return calculateItems.isEmpty
    }
}
