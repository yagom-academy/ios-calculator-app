import Foundation

enum ErrorCases: Error {
    case emptyStackAccess
    case dividedByZero
}

struct Stack {
    private var stack: [String] = []
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var top: String? {
        return stack.last
    }
    
    mutating func push(element: String) {
        stack.append(element)
    }
    
    mutating func pop() -> String? {
        return stack.popLast()
    }
}
