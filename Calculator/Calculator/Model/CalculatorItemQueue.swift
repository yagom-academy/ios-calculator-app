import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    let linkedList = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
//    func enqueue() -> {
//        linkedList.addNode(data: T?)
//        return
//    }
}
