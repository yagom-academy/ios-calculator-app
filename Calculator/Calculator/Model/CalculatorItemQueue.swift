struct CalculatorItemQueue<T>: CalculateItem {
    private var calculateItems = LinkedList<T>()
    
    mutating func enqueue(_ element: T) {
        calculateItems.insert(data: element)
    }
    
    mutating func showHead() -> (data: T?, next: Node<T>?) {
        let headData = calculateItems.head?.data
        let headNext = calculateItems.head?.next
        return (headData, headNext)
    }
    
    mutating func dequeue() {
        if isEmpty() {
            return
        }
        return calculateItems.delete()
    }
    
    mutating func isEmpty() -> Bool {
        if calculateItems.count == 0 {
            return true
        } else {
            return false
        }
    }
}
