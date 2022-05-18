struct Stack<T: CalculatorItem> {
    var stack: [T] = []
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }

        return stack.popLast()
    }
    
}
