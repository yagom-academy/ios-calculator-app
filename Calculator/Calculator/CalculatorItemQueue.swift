
import Foundation

class CalculatorItemQueue<T>: LinkedList<T>{

  
}
 

class Node<T> {
    var data: T
    var pointer: Node?
    
    init(data: T, pointer:Node? = nil) {
        self.data = data
        self.pointer = pointer
    }
}

class LinkedList<String> {
    var head: Node<String>?
    
    init(head: Node<String> ) {
        self.head = head
    }
    
    func hasEmpty(head: Node<String>?) ->Bool {
        return head?.pointer == nil ? true : false
    }
    
    func enqueue(in node: Node<String>) {
        if hasEmpty(head: head){
            head = node
        }
    }
    
}
