struct CalculatorItemQueue<T>: CalculateItem {
    private var calculateItems = LinkedList<T>()
    private var isEmpty: Bool {
        return (calculateItems.count == 0) ? true : false
    }
    
    mutating func enqueue(_ element: T) {
        calculateItems.insert(data: element)
    }
    
    mutating func showHead() -> (data: T?, next: Node<T>?) {
        let headData = calculateItems.head?.data
        let headNext = calculateItems.head?.next
        return (headData, headNext)
    }
    
    mutating func showTail() -> (data: T?, next: Node<T>?) {
        let tailData = calculateItems.tail?.data
        let tailNext = calculateItems.tail?.next
        return (tailData, tailNext)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return calculateItems.delete()
    }
    
    mutating func displayItems() -> Array<T?> {
        var items:Array<T?> = []
        var current = calculateItems.head
        if isEmpty == false {
            (0...calculateItems.count-1).forEach { _ in
                items.append(current?.data ?? nil)
                current = current?.next
            }
        }
        return items
    }
    
    mutating func reset() {
        calculateItems.reset()
    }
}
