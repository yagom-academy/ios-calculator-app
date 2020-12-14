struct Stack<T> {
    var elements = [T]()
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
    
    func peek() -> T? {
        elements.last
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
}
