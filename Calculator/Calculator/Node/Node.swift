final class Node<T> {
    var data: T
    var next: Node?
    var prev: Node<T>?
    
    init(data: T, next: Node? = nil, prev: Node? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}
