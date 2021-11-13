struct CalculatorItemQueue {
    private(set) var items: LinkedList<CalculateItem> = LinkedList()
    
    mutating func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return items.removeFirst()
    }
}

protocol CalculateItem { }

extension Double: CalculateItem { }
