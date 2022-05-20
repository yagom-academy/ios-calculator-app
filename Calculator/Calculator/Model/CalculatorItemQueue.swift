struct CalculatorItemQueue<Item: CalculatorItem> {
    private var calculatorList = LinkedList<Item>()
    var calculatorItems: [Item]? {
        get {
            return calculatorList.returnList()
        }
    }
    var isEmpty: Bool {
        return calculatorList.isEmpty
    }
    
    mutating func enqueue(_ element: Item) {
        calculatorList.add(value: element)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty else { return nil }
    
        return calculatorList.takeOut()
    }
}
