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
}
