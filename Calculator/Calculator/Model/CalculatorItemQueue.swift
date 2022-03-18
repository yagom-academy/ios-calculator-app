import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var linkedList = LinkedList<T>()
    var count: Int = 0
    
    mutating func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enqueue(_ data: T) {
        count += 1
        linkedList.addNode(data: data)
        return
    }
    
    
}
