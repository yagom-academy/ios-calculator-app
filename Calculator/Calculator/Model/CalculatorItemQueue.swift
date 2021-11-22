struct CalculatorItemQueue<Value: CalculateItem> {
    private var firstNode: LinkedListNode<Value>?
    private var lastNode: LinkedListNode<Value>? {
        guard var finderToLastNode = firstNode else {
            return nil
        }
        
        while let nextNode = finderToLastNode.nextNode {
            finderToLastNode = nextNode
        }
        return finderToLastNode
    }
    
    var isEmpty: Bool {
        return firstNode == nil
    }
    
    mutating func enqueue(_ value: Value) {
        let newNode: LinkedListNode<Value> = LinkedListNode<Value>(value: value)
        if isEmpty {
            firstNode = newNode
            return
        }
        lastNode?.link(nextNode: newNode)
    }
    
    mutating func dequeue() -> Value? {
        guard let firstNodeValue = self.firstNode?.value else { return nil }
        
        let secondNode = self.firstNode?.nextNode
        self.firstNode = secondNode
        
        return firstNodeValue
    }
    
    func allItems() -> [Value] {
        var allItems: [Value] = []
        
        var currentNode = self.firstNode
        
        while let item = currentNode?.value {
            allItems.append(item)
            currentNode = currentNode?.nextNode
        }
        
        return allItems
    }
}
