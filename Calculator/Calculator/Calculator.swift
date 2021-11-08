import Foundation


protocol CalculateItem {
    
}

class CalculatorItemQueue<T>: LinkedListManager<T>, CalculateItem {
    func putToQueue(_ putValue: T) {
        addNewNode(putValue)
    }
    
    func getFromQueue() {
        guard self.head?.nodeValue != nil else { return }
        deleteFirstNode()
    }
}

class Node<T> {
    let nodeValue: T
    var pointer: Node?
    
    init(_ nodeValue: T, pointer: Node? = nil) {
        self.nodeValue = nodeValue
        self.pointer = pointer
    }
}
    
class LinkedListManager<T> {
    var head: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    func addNewNode(_ nodeValue: T) {
        if head == nil {
            head = Node(nodeValue)
            return
        }
        var finderToLastNode: Node<T>? = head
        while finderToLastNode?.pointer != nil {
            finderToLastNode = finderToLastNode?.pointer
        }
        finderToLastNode?.pointer = Node(nodeValue)
    }
    
    func deleteFirstNode() {
        head = head?.pointer
    }
}
