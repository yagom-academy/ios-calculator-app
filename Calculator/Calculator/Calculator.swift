import Foundation

class Node<T> {
    let value: T
    var pointer: Node?
    
    init(value: T, pointer: Node? = nil) {
        self.value = value
        self.pointer = pointer
    }
}
    
class ManageLinkedList<T> {
    var head: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    func enQueue(value: T) {
        if head == nil {
            head = Node(value: value, pointer: nil)
            return
        }
        var finderToLastNode: Node<T>? = head
        while finderToLastNode?.pointer != nil {
            finderToLastNode = finderToLastNode?.pointer
            
        }
        finderToLastNode?.pointer = Node(value: value)
    }
    
    func deQueue() {
        head = head?.pointer
    }
}

class CalculatorItemQueue<T>: ManageLinkedList<T> {
    func putToQueue(_ value: T) {
        enQueue(value: value)
    }
    
    func getFromQueue() {
        guard self.head?.value != nil else { return }
        deQueue()
    }
}

