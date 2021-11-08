
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

class LinkedList<T> {
    var head: Node<T>?
    
    init(head: Node<T> ) {
        self.head = head
    }
    
    func hasEmpty(head: Node<T>?) ->Bool {
        return head?.pointer == nil ? true : false
    }
    
    func enqueue(in node: Node<String>) {
        
        if head == nil {
            
        }
    }
    
}
