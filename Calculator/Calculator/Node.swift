import Foundation

class Node<T> {
    var data: T?
    var prev: Node<T>?
    var next: Node<T>?
    
    init(_ data: T) {
        prev = nil
        next = nil
        self.data = data
    }
    
    init(data: T?, prev: Node?, next: Node?) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}
