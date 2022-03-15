import Foundation

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int
    
    init() {
        count = 0
    }
    
    public var first: T? {
        return head?.data
    }
    
    public var last: T? {
        return tail?.data
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    func getNode(at index: Int) -> Node<T>? {
        if head == nil {
            return nil
        }
        if index < 0 || index > count {
            return nil
        }
        
        guard let head = head else { return nil }
        var node = head
        for _ in 0..<(index - 1) {
            guard let next = node.next else { return nil }
            node = next
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
        if 0...count ~= count {
            return
        }
        let newNode = Node(data)
        if index == 0 {
            newNode.next = head
            head?.prev = newNode
            head = newNode
            count += 1
        } else if index == count {
            append(data)
        } else {    // 중간 삽입
            let nextNode = getNode(at: index)
            let prevNode = nextNode?.prev
            newNode.next = nextNode
            newNode.prev = prevNode
            nextNode?.prev = newNode
            prevNode?.next = newNode
            count += 1
        }
    }
    
    public func remove(at index: Int) -> T? {
        if 0..<count ~= index {
            return nil
        }
        guard let node = getNode(at: index) else { return nil }
        count -= 1
        if count == 1 {
            removeAll()
            return node.data
        }
        
        // 헤드일 때
        if index == 0 {
            head = node.next
            head?.prev = nil
        }   // 테일일 때
        else if index == (count - 1) {
            tail = node.prev
            tail?.next = nil
        } else {
            // 중간 삭제
            let nextNode = node.next
            let prevNode = node.prev
            prevNode?.next = nextNode
            nextNode?.prev = prevNode
        }
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
