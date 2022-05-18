struct LinkedList<Item: CalculatorItem> {
    private var firstNode: Node<Item>?
    private var lastNode: Node<Item>?
    var isEmpty: Bool {
        return firstNode == nil
    }
}
