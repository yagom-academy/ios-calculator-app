
import Foundation

class Node<Element> {
    var data: Element
    var pointer: Node?
    
    init(data: Element, pointer: Node? = nil) {
        self.data = data
        self.pointer = pointer
    }
}

class LinkedList<Element> {
    var head: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<Element>? = nil) {
        self.head = head
    }
    
    func enqueue(in data: Element) {
        var finderForLast: Node<Element>?
        
        guard !isEmpty else {
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
        guard !isEmpty else { return }
        
        head = head?.pointer
    }
    
    func dequeueWithData() throws -> Element {
        guard !isEmpty else { throw QueueError.EmptyInLinkedList }
        
        guard let dataOfDequeueNode = head?.data else {
            throw QueueError.EmptyInLinkedList
        }
        
        head = head?.pointer
        return dataOfDequeueNode
    }
    
    func cleanQueue() {
        head = nil
    }
}

