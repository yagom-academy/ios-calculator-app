import Foundation

class LinkedListNode<T> {
    var data: T?
    var prev: LinkedListNode?
    var next: LinkedListNode?
    
    init(data: T?, prev: LinkedListNode? = nil, next: LinkedListNode? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}
