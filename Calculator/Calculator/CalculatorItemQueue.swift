import Foundation

protocol CalculateItem {
}

class CalculatorItemQueue: CalculateItem {
}

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }

    init(head: Node<T>?) {
        self.head = head
    }
    
    func append(value: T) {
        if isEmpty {
            head = Node(value: value)
            return
        }
        
        var finderToTail: Node<T>? = head
        while finderToTail?.next != nil {
            finderToTail = finderToTail?.next
        }
        finderToTail?.next = Node(value: value)
    }
}
