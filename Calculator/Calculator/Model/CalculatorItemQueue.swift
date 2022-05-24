struct CalculatorItemQueue<T>: CalculateItem {
    private var calculateItems = LinkedList<T>()
    private var isEmpty: Bool {
        return (calculateItems.count == 0) ? true : false
    }
    
    func enqueue(_ element: T) {
        calculateItems.append(data: element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return calculateItems.removeFirst()
    }
    
    func displayItems() -> Array<T> {
        return calculateItems.getValues()
    }
    
    func reset() {
        calculateItems.removeAll()
    }
}
