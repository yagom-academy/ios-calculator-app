struct LinkedList<T> {
    
    private class Node<T> {
        var previous: Node<T>?
        var next: Node<T>?
        var data: T
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var head: Node<T>?
    private var tail: Node<T>?
    private var _count: Int
    var count: Int { return _count }

    init () {
        self.head = nil
        self.tail = nil
        self._count = 0
    }
    
    mutating func pushBeforeHead(element: T) {
        let node = Node<T>(data: element)
        
        if tail == nil { tail = node }
        head?.previous = node
        node.next = head
        head = node
        
        _count += 1
    }
    
    mutating func pushAfterTail(element: T) {
        let node = Node<T>(data: element)
        
        if head == nil { head = node }
        tail?.next = node
        node.previous = tail
        tail = node
        
        _count += 1
    }
    
    mutating func popHead() -> T? {
        guard !isEmpty() else { return nil }
        let returnElement = head?.data
        
        head = head?.next
        head?.previous = nil
        
        _count -= 1
        return returnElement
    }
    
    mutating func popTail() -> T? {
        guard !isEmpty() else { return nil }
        let returnElement = tail?.data
        
        tail = tail?.previous
        tail?.next = nil
        
        _count -= 1
        return returnElement
    }
    
    func peekHead() -> T? {
        return head?.data
    }
    
    func peekTail() -> T? {
        return tail?.data
    }
    
    func isEmpty() -> Bool {
        return _count == 0 ? true : false
    }
}
