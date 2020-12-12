
class Stack<T> {
    var elements = [T]()
    
    func pop() -> T? {
        return self.elements.popLast()
    }
    
    func push(_ element: T) {
        self.elements.append(element)
    }
    
    func peek() -> T? {
        return self.elements.last
    }
}

