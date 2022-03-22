import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    private var linkedList = LinkedList<T>()
    var count: Int
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.addNode(data: data)
        count += 1
    }
    
    mutating func dequeue() -> T? {
        if linkedList.head == nil || linkedList.head?.next == nil {
            count = 0
        } else {
            count += 1
        }
        return linkedList.removeFirstNode()
    }
}
