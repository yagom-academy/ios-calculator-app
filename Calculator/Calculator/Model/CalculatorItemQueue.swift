struct CalculatorItemQueue<T>: CalculateItem {
    var calculateItems = [T]()
    private(set) var head = -1
    
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
        head = -1
    }
    
    mutating func peak() -> T? {
        if isEmpty() {
            return nil
        }
        
        if head >= calculateItems.count-1 {
            head = calculateItems.count-1
        } else {
            head += 1
        }
        
        return calculateItems[head]
    }
    
    mutating func isEmpty() -> Bool {
        head = -1
        return calculateItems.isEmpty
    }
}
