protocol CalculateItem { }

struct NumberItem: CalculateItem {
    var value: Double
}

struct OperatorItem: CalculateItem {
    var operation: (NumberItem, NumberItem) -> NumberItem
}

struct CalculatorItemQueue {
    private(set) var items: LinkedList<CalculateItem> = LinkedList()
    
    mutating func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        if items.isEmpty {
            return nil
        }
        return items.removeFirst()
    }
}

extension NumberItem: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Equatable {
    init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
    
    init(integerLiteral value: IntegerLiteralType) {
        self.value = Double(value)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func + (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value + rhs.value
        return Self(value: result)
    }
    
    static func - (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value - rhs.value
        return Self(value: result)
    }
    
    static func / (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value / rhs.value
        return Self(value: result)
    }
    
    static func * (lhs: Self, rhs: Self) -> Self {
        let result = lhs.value * rhs.value
        return Self(value: result)
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

class LinkedList<T> {
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
    
    private init(head: Node<T>?) {
        self.head = head
        self.tail = head
    }
    
    convenience init(value: T? = nil) {
        self.init(head: Node(value))
    }
    
    private func append(_ newNode: Node<T>) {
        if let tail = tail {
            tail.next = newNode
            self.tail = tail.next
        } else {
            self.head = newNode
            self.tail = newNode
        }
    }
    
    func append(_ value: T) {
        append(Node(value))
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func removeFirst() -> T? {
        let result = head?.value
        
        if count == 1 {
            removeAll()
        } else {
            head = head?.next
        }
        
        return result
    }
}
