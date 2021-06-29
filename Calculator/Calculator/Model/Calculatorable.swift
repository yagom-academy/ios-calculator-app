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
    
    func makeInfixExpression(from userInput: [String]) -> [String] {
        var infixExpression = [String]()
        var infixNumberString = ""
        
        for userInput in userInput {
            let userInputType = try? CalculatorComponent.convertToComponentType(from: userInput)
            
            switch userInputType {
            case .number:
                infixNumberString += userInput
            case .operator:
                infixExpression.append(infixNumberString)
                infixExpression.append(userInput)
                infixNumberString = ""
            default:
                ErrorCase.unknownInputCase
            }
        }
        
        return infixExpression
    }
    
    func convertToPostfixExpression(fromInfix input: [String]) -> [String] {
        var postfix = [String]()
        var stack = Stack()
        
        for currentElement in input {
            let currentType = try? CalculatorComponent.convertToComponentType(from: currentElement)
            
            if currentType == .number {
                postfix.append(currentElement)
            } else {
                if let lastElement = stack.pop() {
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
        
        while stack.peek() != nil {
            if let element = stack.pop() {
                postfix.append(element)
            }
        }
        
        return postfix
    }
}
