class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count = 0
    
    func append(data: T) {
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
    func removeFirst() -> T? {
        let data = head?.data
        let nextNode = head?.next
        
        if count  == 1 {
            removeAll()
        } else if count > 1 {
            nextNode?.prev = nil
            head?.next = nil
            head = nextNode
            count -= 1
        }
        return data ?? nil
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func showData() -> Array<T?> {
        if count == 0 {
            return []
        }
        
        var data:Array<T?> = []
        var current = head
        (0...count-1).forEach { _ in
            data.append(current?.data ?? nil)
            current = current?.next
        }
        return data
    }
}
