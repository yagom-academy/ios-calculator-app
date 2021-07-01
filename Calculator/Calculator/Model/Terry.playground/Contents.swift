import UIKit

class Stack {
    var stack = [String]()
    //비었는지
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    //?
    func top() -> String? { //
        return stack.last
    }
    //스택 배열 끝에 새 원소 추가
    func push(element: String) {
        stack.append(element)
    }
    //스택 배열 끝의 원소 제거
    func pop() -> String? {
        return stack.popLast()
    }
}

enum ErrorCases: Error {
    case emptyStackAccess
    case dividedByZero
}

class Calculator {
    var currentInput = ""
    var infixNotation = [String]()
    
    //연산자 우선순위 구분
    func isPriorityOperator(_ first: String, _ second: String) -> Bool {
        let highPriorityOperator = Set(["*", "/"])
        let lowerPriorityOperator = Set(["+", "-"])
        return highPriorityOperator.contains(first) && lowerPriorityOperator.contains(second)
    }
    
    func moveNonPriorityOperator(from stack: Stack, to postfix: inout [String], than element: String) {
        while let top = stack.top(), !isPriorityOperator(element, top) {
            guard let top = stack.pop() else { continue }
            postfix.append(top)
        }
    }
    
    func convertToPostfix() -> [String] {
        let tempStack = Stack()
        var postfix = [String]()
        
        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            moveNonPriorityOperator(from: tempStack, to: &postfix, than: element)
            tempStack.push(element: element)
        }
        while let top = tempStack.pop() {
            postfix.append(top)
        }
        return postfix
    }
    
    func calculatePostfix() throws -> String? {
        let postfix = convertToPostfix()
        let tempStack = Stack()
        
        for element in postfix {
            if let _ = Double(element) {
                tempStack.push(element: element)
                continue
            }
            guard let operand2 = tempStack.pop(), let operand1 = tempStack.pop() else {
                continue
            }
            if let operand2 = Double(operand2), let operand1 = Double(operand1) {
                var result: Double?
                switch element {
                case "+":
                    result = operand1 + operand2
                case "-":
                    result = operand1 - operand2
                case "*":
                    result = operand1 * operand2
                case "/":
                    if operand2 == 0 {
                        throw ErrorCases.dividedByZero
                    }
                    result = operand1 / operand2
                default: break
                }
                if let result = result {
                    tempStack.push(element: String(result))
                }
                
            }
            
        }
        return tempStack.pop()
    }
    
    
}
