import Foundation

class Infix {
    var infix: [String] = []
}

class Postfix {
    var postfix = Stack<String>()
    var operatorsStack = Stack<String>()
    
    func separateInfix(from infix: Array<String>) {
        infix.forEach {
            if isNumberInInfix(item: $0) {
                addToPostfix(item: $0)
            } else if operatorsStack.isEmpty() {
                addToOperatorStack(item: $0)
            } else {
                guard let unwrappedOperatrosStack = operatorsStack.top() else { return }
                comparePriority(lastOfOperatorStack: changeToOperatorsEnum(unwrappedOperatrosStack),
                                with: changeToOperatorsEnum($0))
            }
        }
        processLeftOperatorStack()
    }
    
    func isNumberInInfix(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        return !operators.contains(item)
    }
    
    func addToPostfix(item: String) {
        postfix.push(item: item)
    }
    
    func addToOperatorStack(item: String) {
        operatorsStack.push(item: item)
    }
    
    func changeToOperatorsEnum(_ item: String) -> Operator? {
        let lastStackOperator = item
        
        switch lastStackOperator {
        case "+":
            return Operator.plus
        case "−":
            return Operator.minus
        case "×":
            return Operator.multiply
        case "÷":
            return Operator.divide
        default:
            return nil
        }
    }
    
    func comparePriority(lastOfOperatorStack: Operator?, with input: Operator?) {
        guard let unwrappedLastOfOperatorStack = lastOfOperatorStack, let unwrappedInput = input else { return }
        if unwrappedLastOfOperatorStack < unwrappedInput {
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else if unwrappedLastOfOperatorStack == unwrappedInput {
            addToPostfix(item: unwrappedLastOfOperatorStack.operatorSymbol)
            operatorsStack.pop()
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else {
            while !operatorsStack.isEmpty() {
                guard let lastItem = operatorsStack.pop() else {
                    return
                }
                addToPostfix(item: lastItem)
            }
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        }
    }
    
    func processLeftOperatorStack() {
        while !operatorsStack.isEmpty() {
            guard let leftItem = operatorsStack.pop() else {
                return
            }
            postfix.push(item: leftItem)
        }
    }
}
