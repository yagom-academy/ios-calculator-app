import Foundation

struct Stack<T> {
    var index = [T]()
    
    func pop() -> T {
        return self.index.popLast()
    }
    
    func push(element: T) {
        self.index.append(element)
    }
    
    func peek() -> T {
        return self.index.last
    }
}
