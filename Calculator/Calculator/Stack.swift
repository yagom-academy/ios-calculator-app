import Foundation

enum ErrorCases: Error {
    case emptyStackAccess
    case dividedByZero
}

struct Stack<T> {
    private var stack: [T] = []
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var top: T? {
        return stack.last
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}
