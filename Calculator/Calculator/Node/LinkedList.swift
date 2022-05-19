class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count = 0

    func insert(data: T) {
        count += 1
        if head == nil {
            head = Node(data: data, next: nil, prev: nil)
            tail = head
            return
        }
        
        let newNode = Node(data: data, next: nil, prev: tail)
        tail?.next = newNode
        tail = newNode
    }
    
    @discardableResult
    func delete() -> T? {
        let data = tail?.data
        let prevNode = tail?.prev
        
        if count  == 1 {
            reset()
        } else if count > 1 {
            prevNode?.next = nil
            tail?.prev = nil
            tail = prevNode
            count -= 1
        }
        
        return data ?? nil
    }
    
    func reset() {
        head = nil
        tail = nil
        count = 0
    }
}
