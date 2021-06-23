import Foundation

enum Operator: String {
    case add = "+"
    case substract = "-"
    case multiply = "*"
    case divide = "/"
    
}

class Calculator {
    var currentInput = ""
    var infixNotation = [String]()
    
    func isPrior(operator first: Operator, to second: Operator) -> Bool {
        return "*/".contains(first) && "+-".contains(second.rawValue)
    }
    
    func pushOperator(to stack: Stack, postfix: inout [String], element: Operator) {
        while let top = Operator(rawValue: stack.top()), !isPrior(operator: element, to: top) {
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
    
    func calculatePosfix() {
        let postfix = convertToPosfix()
        let tempStack = Stack()
        
        for element in postfix {
            
            //743-+
            if let _  = Double(element) {
                tempStack.push(element: element)
                continue
            }
            if let operand2 = Double(tempStack.pop()), let operand1 = Double(tempStack.pop()) {
                switch element {
                
                case "+":
                case "-":
                case "*":
                case "/":
                default:
                    break
                }
                
                
                
            }
            
        }
    }
    
}
