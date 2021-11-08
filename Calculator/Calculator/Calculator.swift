import Foundation

class CalculatorItemQueue<T>: ManageLinkedList<T> {

    func putToQueue(_ value: T) {
        enQueue(value: value)
    }
    
    func getFromQueue() {
        deQueue()
    }
}

class Node<T> {
    let value: T
    var pointer: Node?
    
    init(value: T, pointer: Node?) {
        self.value = value
        self.pointer = pointer
    }
}
    
class ManageLinkedList<T> {
    var head: Node<T>?
    var lastNode: Node<T>?
    
    func enQueue(value: T) {
        if head == nil {
            head = Node(value: value, pointer: nil)
            lastNode = head
            return
        }
        
        lastNode = head
        while lastNode?.pointer != nil {
            lastNode = lastNode?.pointer
        }
        lastNode?.pointer = Node(value: value, pointer: nil)
    }
    
    func deQueue() {
        head = head?.pointer
    }
    
}


