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
    var previousness: Node<T>?

    func insert(data: T) {
        if head == nil {
            head = Node(data: data, next: nil)
            previousness = head
            tail = head
            return
        }
        
        tail?.next = Node(data: data, next: nil)
        previousness = tail
        tail = tail?.next
    }
    
    func delete() {
        previousness?.next = nil
        tail = previousness
        moveToPreviousness()
    }
    
    func moveToPreviousness() {
        var current = head
        var before:Node<T>?
        while current?.next != nil {
            before = current
            current = current?.next
        }
        previousness = before
    }
}
