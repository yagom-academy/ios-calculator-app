import Foundation

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




class Calculator {
    var currentInput = ""
    var infixNotation = [String]()
    
    func isPrior(operator first: String, to second: String) -> Bool {
        return "*/".contains(first) && "+-".contains(second)
    }
    
    func pushOperator(to stack: Stack, postfix: inout [String], element: String) {
        while let top = stack.pop(), !isPrior(operator: element, to: top) {
            postfix.append(top)
        }
        stack.push(element: element)
    }

    func convertToPosfix() -> [String] {
        let tempStack = Stack()
        var postfix = [String]()
        
        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            pushOperator(to: tempStack, postfix: &postfix, element: element)
        }
        while let top = tempStack.pop() {
            postfix.append(top)
        }
        return postfix
    }
    
    func calculatePosfix() -> String {
        let postfix = convertToPosfix()
        let tempStack = Stack()
        
        for element in postfix {
            if let _  = Double(element) {
                tempStack.push(element: element)
                continue
            }
            if let operand2 = Double(tempStack.pop()!), let operand1 = Double(tempStack.pop()!) {
                var result: Double?
                switch element {
                case "+":
                    result = operand1 + operand2
                case "-":
                    result = operand1 - operand2
                case "*":
                    result = operand1 * operand2
                case "/":
                    result = operand1 / operand2
                default:
                    break
                }
                tempStack.push(element: String(result!))
            }
        }
        return tempStack.pop()!
    }
    
}

var c = Calculator()
c.infixNotation = ["5","+","2","/","7","*","4"]
let result = c.calculatePosfix()

print(result)
