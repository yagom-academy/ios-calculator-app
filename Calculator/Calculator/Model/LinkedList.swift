
import Foundation

class Node<Element> {
    var data: Element
    var pointer: Node?
    
    init(data: Element, pointer:Node? = nil) {
        self.data = data
        self.pointer = pointer
    }
}

class LinkedList<Element> {
    var head: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<Element>) {
        self.head = head
    }
    
    func enqueue(in data: Element) {
        var finderForLast: Node<Element>?
        
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

