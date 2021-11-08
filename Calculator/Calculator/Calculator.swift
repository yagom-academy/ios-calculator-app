import Foundation


protocol CalculateItem {
    
}

class CalculatorItemQueue<T>: LinkedListManager<T>, CalculateItem {
    func putToQueue(_ value: T) {
        addNewNode(value)
    }
    
    func getFromQueue() {
        guard self.head?.value != nil else { return }
        deleteFirstNode()
    }
}

class Node<T> {
    let value: T
    var pointer: Node?
    
    init(_ value: T, pointer: Node? = nil) {
        self.value = value
        self.pointer = pointer
    }
}
    
class LinkedListManager<T> {
    var head: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    func addNewNode(_ value: T) {
        if head == nil {
            head = Node(value)
            return
        }
        var finderToLastNode: Node<T>? = head
        while finderToLastNode?.pointer != nil {
            finderToLastNode = finderToLastNode?.pointer
        }
        finderToLastNode?.pointer = Node(value)
    }
    
    func deleteFirstNode() {
        head = head?.pointer
    }
}
