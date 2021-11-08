
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
    var head: Node<T>
    
    init(head: Node<T> ) {
        self.head = head
    }
    
}
