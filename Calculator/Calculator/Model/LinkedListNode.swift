import Foundation

class LinkedListNode<T> {
    var data: T
    var next: LinkedListNode?
    
    init(data: T) {
        self.data = data
    }
}
