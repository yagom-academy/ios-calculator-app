import Foundation

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int
        
    init() {
        count = 0
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    func node(at index: Int) -> Node<T>? {
        if head == nil {
            return nil
        }
        
        guard 0..<count ~= index else { return nil }
        guard let head = head else { return nil }
        var node = head
        if index > 0 {
            for _ in 0..<index {
                guard let next = node.next else { return nil }
                node = next
            }
        }
        
        return node
    }
    
    public func append(_ data: T) {
        let newNode = Node(data)
        guard head != nil else {
            head = newNode
            tail = newNode
            count = 1
            return
        }
        newNode.prev = tail
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    public func insert(_ data: T, at index: Int) {
        guard 0...count ~= index else { return }
        let newNode = Node(data)
        if index == 0 {
            newNode.next = head
            head?.prev = newNode
            head = newNode
            count += 1
        } else if index == count {
            append(data)
        } else {
            let nextNode = node(at: index)
            let prevNode = nextNode?.prev
            newNode.next = nextNode
            newNode.prev = prevNode
            nextNode?.prev = newNode
            prevNode?.next = newNode
            count += 1
        }
    }
    
    public func remove(at index: Int) -> T? {
        guard 0..<count ~= index else { return nil }
        guard let node = node(at: index) else { return nil }
        
        if count == 1 {
            removeAll()
            return node.data
        }
        
        if index == 0 {
            head = node.next
            head?.prev = nil
        }
        else if index == (count - 1) {
            tail = node.prev
            tail?.next = nil
        } else {
            let nextNode = node.next
            let prevNode = node.prev
            prevNode?.next = nextNode
            nextNode?.prev = prevNode
        }
        count -= 1
        node.next = nil
        node.prev = nil
        return node.data
    }
    
    public func peekData() -> T? {
        guard let head = head else { return nil }
        return head.data
    }
    
    public func removeHead() -> T? {
        return remove(at: 0)
    }
    
    public func removeAll() {
        count = 0
        head = nil
        tail = nil
    }
}
