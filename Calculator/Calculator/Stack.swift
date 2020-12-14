import Foundation

struct Stack<T> {
    var index = [T]()
    
    mutating func pop() -> T {
        return self.index.popLast()
    }
    
    mutating func push(element: T) {
        self.index.append(element)
    }
    
    func peek() -> T {
        return self.index.last
    }
    
    func var isEmpty: Bool {
        return self.index.isEmpty
    }
    
    func var count: Int {
        return self.index.count
    }
}
