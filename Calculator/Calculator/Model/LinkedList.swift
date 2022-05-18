struct LinkedList<Item: CalculatorItem> {
    private(set) var firstNode: Node<Item>?
    private var lastNode: Node<Item>?
    var isEmpty: Bool {
        return firstNode == nil
    }
    
    mutating func add(value: Item) {
        let newNode = Node(value)
        
        if isEmpty {
            firstNode = newNode
            lastNode = newNode
        }else {
            firstNode?.next = newNode
            lastNode = newNode
        }
    }
}
