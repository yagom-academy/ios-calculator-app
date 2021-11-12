struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    init(value: T? = nil) {
        let value = Node(value)
        self.head = value
        self.tail = value
    }
    
    mutating func append(_ value: T) {
        let newNode = Node(value)
        if let tail = tail {
            tail.next = newNode
            self.tail = tail.next
        } else {
            self.head = newNode
            self.tail = newNode
        }
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func removeFirst() -> T? {
        let result = head?.value
        
        if count == 1 {
            removeAll()
        } else {
            head = head?.next
        }
        return result
    }
}

extension LinkedList {
    class Node<T> {
        var value: T
        var next: Node<T>?
        
        init(_ value: T) {
            self.value = value
        }
        
        convenience init?(_ value: T?) {
            guard let value = value else {
                return nil
            }
            self.init(value)
        }
    }
}
