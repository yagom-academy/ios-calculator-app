//  Created by Aejong on 2022/09/21.

struct CalculatorItemQueueByLinkedList<T> {
    
    var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    var front: T? {
        return self.linkedList.head?.value
    }
    
    mutating func enqueue(_ item: T) {
        self.linkedList.appendValue(item)
    }
    
    mutating func dequeue() -> T? {
        return self.linkedList.removeHead()
    }
}
