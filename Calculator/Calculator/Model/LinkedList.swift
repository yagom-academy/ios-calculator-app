struct LinkedList<Item: CalculatorItem> {
    private var firstNode: Node<Item>?
    private(set) var lastNode: Node<Item>?
    var isEmpty: Bool {
        return firstNode == nil
    }
    
    mutating func add(value: Item) {
        let newNode = Node(value)
        
        if isEmpty {
            firstNode = newNode
            lastNode = newNode
        } else {
            lastNode?.next = newNode
            newNode.previous = lastNode
            lastNode = newNode
        }
    }
    
    mutating func takeOut() -> Item? {
        guard !isEmpty else { return nil }
        
        let node = firstNode
        firstNode = firstNode?.next
        firstNode?.previous = nil
        
        return node?.value
    }
    
}
