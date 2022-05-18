class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var previousness: Node<T>?
    var count = 0

    func insert(data: T) {
        count += 1
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
        count -= 1
        previousness?.next = nil
        tail = previousness
        moveToPreviousness()
    }
    
    func moveToPreviousness() {
        var current = head
        var before:Node<T>?
        (0...count-2).forEach { _ in
            before = current
            current = current?.next
        }
        previousness = before
    }
}
