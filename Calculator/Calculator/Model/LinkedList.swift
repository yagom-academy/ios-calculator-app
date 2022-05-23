struct LinkedList<Item: CalculatorItem> {
    private var firstNode: Node<Item>?
    private var lastNode: Node<Item>?
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
            newNode.next = firstNode
            lastNode = newNode
        }
    }
    
    mutating func takeOut() -> Item? {
        guard !isEmpty else { return nil }

        let node = firstNode
        
        guard firstNode != lastNode else {
            firstNode = nil
            return node?.value
        }
        
        firstNode = firstNode?.next
        lastNode?.next = firstNode
        
        return node?.value
    }

    func returnList() -> [Item]? {
        guard !isEmpty else { return nil }
        
        var allNodes: [Item] = []
        var node: Node? = firstNode
        
        repeat {
            if let nextNode = node {
                allNodes.append(nextNode.value)
            }
            node = node?.next
        } while node != firstNode && node != nil
        
        return allNodes
    }
}
