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
    private var _count: Int
    var count: Int { return _count }

    init () {
        self.head = nil
        self._count = 0
    }
    
    mutating func pushBeforeHead(element: T) {
        let node = Node<T>(data: element)
        
        head?.previous = node
        node.next = head
        head = node
        
        _count += 1
    }
    
}
