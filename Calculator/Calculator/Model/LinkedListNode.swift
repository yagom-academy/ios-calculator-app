import Foundation

class LinkedListNode<T> {
    var data: T?
    var next: LinkedListNode?
    
    init(data: T, next: LinkedListNode? = nil) {
        self.data = data
        self.next = next
    }
}
