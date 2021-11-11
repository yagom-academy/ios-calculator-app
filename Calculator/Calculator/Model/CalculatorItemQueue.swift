import Foundation

struct CalculatorItemQueue {
    var firstNode: LinkedListNode?
    var lastNode: LinkedListNode?
    
    mutating func enqueue(_ item: CalculateItem) {
        if let backupOfLastNode = self.lastNode {
            self.lastNode = LinkedListNode(value: item)
            backupOfLastNode.nextNode = self.lastNode
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
    
    func allItems() -> [CalculateItem] {
        var allItems: [CalculateItem] = []
        
        var currentNode = self.firstNode
        
        while let currentValue = currentNode?.value {
            allItems.append(currentValue)
            currentNode = currentNode?.nextNode
        }
        
        return allItems
    }
}
