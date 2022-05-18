class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var previousness: Node<T>?
    private(set) var count = 0

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
    
    func delete() -> T? {
        let data = tail?.data
        count -= 1
        previousness?.next = nil
        tail = previousness
        
        if count == 0 {
            previousness = nil
            
        } else if count > 1 {
            moveToPreviousness()
        }
        
        return data ?? nil
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
