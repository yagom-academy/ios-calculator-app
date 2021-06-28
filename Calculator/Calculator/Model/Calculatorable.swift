import Foundation

enum ErrorCase: Error {
    case unknownInputCase
}

enum CalculatorComponent {
    case number
    case `operator`
    case equalSign
    case allClear
    case clearEntry
    case signConverter
    case dot
    
    static func convertToComponentType(from userInput: String) throws -> Self {
        switch userInput {
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "00", "." :
            return .number
        case "/", "*", "+", "-" :
            return .operator
        case "=" :
            return .equalSign
        case "AC" :
            return .allClear
        case "CE" :
            return .clearEntry
        case "⁺⁄₋" :
            return .signConverter
        default:
            throw ErrorCase.unknownInputCase
        }
    }
    
}

protocol Calculatorable {
    func convertToPostfixExpression(fromInfix input: [String]) -> [String]
    func calculatePostfixExpression(postfix: [String]) throws -> Double
}

extension Calculatorable {
    private func checkPriority(A a: String, isLowerThenB b: String) -> Bool {
        if ["+", "-"].contains(a), ["*", "/"].contains(b) {
            return true
        }
        return false
    }
    
    func convertToPostfixExpression(fromInfix input: [String]) -> [String] {
        var postfix = [String]()
        var numberString = ""
        var stack = Stack()
        
        for currentElement in input {
            let currentType = try? CalculatorComponent.convertToComponentType(from: currentElement)
            
            if currentType == .number {
                numberString += currentElement
            } else {
                postfix.append(numberString)
                numberString = ""
                
                if let checkedElement = stack.peek(),
                   let lastElement = stack.pop() {
                    
                    if checkPriority(A: lastElement, isLowerThenB: currentElement) {
                        stack.push(element: lastElement)
                        stack.push(element: currentElement)
                    } else {
                        postfix.append(lastElement)
                        stack.push(element: currentElement)
                    }
                    
                } else {
                    stack.push(element: currentElement)
                }
            }
        }
        
        postfix.append(numberString)
        
        numberString = ""
        
        while stack.peek() != nil {
            if let element = stack.pop() {
                postfix.append(element)
            }
        }
        
        return postfix
    }
}
