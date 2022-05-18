//class Node<T> {
//    var data: T
//    var next: Node?
//
//    init(data: T, next: Node? = nil) {
//        self.data = data
//        self.next = next
//    }
//}


class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var previous: Node<T>?

    func insert(data: T) {
        if head == nil {
            head = Node(data: data, next: nil)
            previous = head
            tail = head
            return
        }
        
        tail?.next = Node(data: data, next: nil)
        previous = tail
        tail = tail?.next
    }
}
