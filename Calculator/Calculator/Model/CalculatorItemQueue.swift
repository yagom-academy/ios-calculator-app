import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var linkedList = LinkedList<T>()
    func countNumber() -> Int {
        return linkedList.count
    }
    
    mutating func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.addNode(data: data)
        return
    }
    
    mutating func dequeue() {
        return linkedList.removeFirstNode()
    }
    
}
