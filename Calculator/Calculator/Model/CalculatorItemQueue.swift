import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var linkedList = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enqueue(_ data: T) {
        return linkedList.addNode(data: data)
    }
    
    
}
