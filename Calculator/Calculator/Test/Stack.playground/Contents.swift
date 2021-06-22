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
    
    func top() -> String? {
        return stack.last
    }
    
    func push(element: String) {
        stack.append(element)
    }
    
    func pop() -> String? {
        return stack.removeLast()
    }
}

let stack = Stack()
stack.push(element: "지원")
let a = stack.top()
print(a)
