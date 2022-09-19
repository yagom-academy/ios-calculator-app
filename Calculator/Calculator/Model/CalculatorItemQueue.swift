protocol CalculateItem { }

struct CalculatorItemQueue<T>: CalculateItem {
    private(set) var head: Node<T>? = nil
    private(set) var tail: Node<T>? = nil
    private(set) var count: Int = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func enqueue(_ element: T) {
        let node = Node<T>(data: element)
        if isEmpty {
            head = node
            tail = node
            head?.next = tail
        } else {
            tail?.next = node
            tail = node
        }
        self.count += 1
    }
    
    mutating func dequeue() -> T? {
        guard let nowHead = self.head else {
            return nil
        }
        let nextHead = nowHead.next
        self.head = nil
        self.head = nextHead
        self.count -= 1
        return nowHead.data
    }
    
    func peak() -> T? {
        return head?.data
    }
    
    func clear() {
        
    }
}

class Node<T> {
    var next: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
