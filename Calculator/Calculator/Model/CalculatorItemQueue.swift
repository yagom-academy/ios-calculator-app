struct CalculatorItemQueue {
    private var items: LinkedList<CalculateItem> = LinkedList()
    
    init(_ items: [CalculateItem] = []) {
        items.forEach{ enqueue($0) }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func enqueue(_ item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return items.removeFirst()
    }
}
