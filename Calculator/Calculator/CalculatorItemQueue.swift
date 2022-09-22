//  Created by Aejong on 2022/09/21.

struct CalculatorItemQueue {
    
    var queue: [String] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    mutating func dequeue() -> String? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

class LinkedListNode<T> {
    let value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    
    private(set) var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
}
