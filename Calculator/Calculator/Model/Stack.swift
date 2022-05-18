struct Stack<T: CalculatorItem> {
    var stack: [T] = []
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        stack.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty() else { return nil }

        return stack.popLast()
    }
    
}
