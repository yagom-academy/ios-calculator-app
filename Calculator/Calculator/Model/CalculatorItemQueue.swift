struct CalculatorItemQueue<Item: CalculateItem> {
    private var calculateItems = LinkedList<Item>()
    private var isEmpty: Bool {
        return (calculateItems.count == 0) ? true : false
    }
    
    func enqueue(_ element: Item) {
        calculateItems.append(data: element)
    }
    
    @discardableResult
    func dequeue() -> Item? {
        if isEmpty {
            return nil
        }
        return calculateItems.removeFirst()
    }
    
    func displayItems() -> Array<Item> {
        return calculateItems.getValues()
    }
    
    func reset() {
        calculateItems.removeAll()
    }
}
