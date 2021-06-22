import Foundation

enum ErrorCases: Error {
    case emptyStackAccess
    case dividedByZero
}

class Stack {
    var stack: [String] = []
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func top() throws -> String {
        if stack.isEmpty {
            throw ErrorCases.emptyStackAccess
        }
        return stack[stack.count - 1]
    }
    
    func push(element: String) {
        stack.append(element)
    }
    
    func pop() throws {
        if stack.isEmpty {
            throw ErrorCases.emptyStackAccess
        }
        stack.removeLast()
    }
}
