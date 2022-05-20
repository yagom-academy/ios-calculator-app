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
    private lazy var currentNodeForSequence: Node<T>? = head

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
    
    mutating func insert(_ newElement: T, at index: Int) -> Result<T, LinkedListError> {
        guard let head = head else { return .failure(LinkedListError.listIsEmpty) }
        
        var oldNode: Node<T> = head
        let newNode = Node<T>(data: newElement)
        
        for _ in (0..<index) {
            guard let nextCurrentNode = oldNode.next else { return .failure(LinkedListError.indexOutOfRange) }
            oldNode = nextCurrentNode
        }
        
        newNode.next = oldNode
        newNode.previous = oldNode.previous
        newNode.previous?.next = newNode
        oldNode.previous = newNode
        
        if index == 0 { self.head = newNode }
        _count += 1
    
        return .success(oldNode.data)
    }
    
    mutating func remove(at index: Int) -> Result<T, LinkedListError> {
        guard let head = head else { return .failure(LinkedListError.listIsEmpty) }
        var currentNode: Node = head
        
        for _ in (0..<index) {
            guard let nextCurrentNode = currentNode.next else { return .failure(LinkedListError.indexOutOfRange) }
            currentNode = nextCurrentNode
        }
        
        let removedElement = currentNode.data
        currentNode.previous?.next = currentNode.next
        currentNode.next?.previous = currentNode.previous
        currentNode.previous = nil
        currentNode.next = nil
        
        _count -= 1
        return Result.success(removedElement)
    }
    
    subscript(index: Int) -> Result<T, LinkedListError> {
        guard let head = head else { return .failure(LinkedListError.listIsEmpty) }
        var currentNode: Node = head
        
        for _ in 0..<index {
            guard let nextCurrentNode = currentNode.next else { return .failure(LinkedListError.indexOutOfRange) }
            currentNode = nextCurrentNode
        }
        
        return .success(currentNode.data)
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.pushAfterTail(element: $0) }
    }
}

extension LinkedList: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        defer { currentNodeForSequence = currentNodeForSequence?.next }
        return currentNodeForSequence?.data
    }
}

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        let stringArray = self.map { "\($0)" }
        let returnString = stringArray.joined(separator: ", ")
        return "[" + returnString + "]"
    }
    
    var debugDescription: String {
        let stringArray = self.map { "\($0)" }
        let returnString = stringArray.joined(separator: ", ")
        return "[" + returnString + "]"
    }
}
