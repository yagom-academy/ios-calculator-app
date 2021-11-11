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
        
        if self.firstNode === self.lastNode {
            self.lastNode = nil
        }
        self.firstNode = nil
        
        return firstNodeValue
    }
    
    func printAllItems() {
        print("PrintAllItems() - start")
        var currentNode = self.firstNode
        
        while currentNode != nil {
            if let `operand` = currentNode?.value as? Double {
                print(`operand`)
            }
            else if let `operator` = currentNode?.value as? Operator {
                print(`operator`.rawValue)
            }
            
            currentNode = currentNode?.nextNode
        }
        print("PrintAllItems() - end")
    }
}
