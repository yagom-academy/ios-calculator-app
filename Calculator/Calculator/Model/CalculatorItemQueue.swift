import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T> {
    private let linkedList = LinkedList<T>()

    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.addNode(data: data)
    }
    
    mutating func dequeue() -> T? {
        if linkedList.head == nil || linkedList.head?.next == nil {
        } else {
        }
        return linkedList.removeFirstNode()
    }
}
