
import Foundation

class Node<T> {
    var data: T
    var pointer: Node?
    
    init(data: T, pointer:Node? = nil) {
        self.data = data
        self.pointer = pointer
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<T>) {
        self.head = head
    }
    
    func enqueue(in data: T) {
        var finderForLast: Node<T>?
        
        guard isEmpty == false else {
            head = Node(data: data, pointer: nil)
            return
        }
        
        finderForLast = head
        while finderForLast?.pointer != nil {
            finderForLast = finderForLast?.pointer
        }
        finderForLast?.pointer = Node(data: data, pointer: nil)
    }
    
    func dequeue() {
        guard isEmpty == false else { return }
        
        head = head?.pointer
    }
}

