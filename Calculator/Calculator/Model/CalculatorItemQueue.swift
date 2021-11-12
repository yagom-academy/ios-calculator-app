struct CalculatorItemQueue {
    var firstNode: LinkedListNode?
    weak var lastNode: LinkedListNode?
    
    mutating func enqueue(_ item: CalculateItem) {
        if let backupOfLastNode = self.lastNode {
            let newLastNode = LinkedListNode(value: item)
            backupOfLastNode.nextNode = newLastNode
            self.lastNode = newLastNode
        } else {
            self.firstNode = LinkedListNode(value: item)
            self.lastNode = self.firstNode
        }
    }
    
    mutating func dequeue() -> CalculateItem? {
        guard let firstNodeValue = self.firstNode?.value else { return nil }
        
        let secondNode = self.firstNode?.nextNode
        self.firstNode = secondNode
        
        return firstNodeValue
    }
    
    func allOperands() -> [Double] {
        var allOperands: [Double] = []
        
        var currentNode = self.firstNode
        
        while let operand = currentNode?.value as? Double {
            allOperands.append(operand)
            currentNode = currentNode?.nextNode
        }
        
        return allOperands
    }
    
    func allOperators() -> [Operator] {
        var allOperators: [Operator] = []
        
        var currentNode = self.firstNode
        
        while let operand = currentNode?.value as? Operator {
            allOperators.append(operand)
            currentNode = currentNode?.nextNode
        }
        
        return allOperators
    }
}
