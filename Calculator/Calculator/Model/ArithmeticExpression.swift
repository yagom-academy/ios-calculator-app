import Foundation

class Infix {
    var infix: Array<String> = []
}

class Postfix {
    var postfix: Array<String> = []
    var operatorsStack: Array<String> = []
    
    func separateNumberAndOperator(from infix: Array<String>) {
        for item in infix {
            if isNumberInInfix(item: item) {
                addToPostfix(member: item)
            } else if operatorsStack.isEmpty {
                addToOperatorStack(of: item)
            } else {
                compareAndDecidePriority(lastStack: changeToOperatorsEnum(operatorsStack.last!),
                                            with: changeToOperatorsEnum(item))
            }
        }
        processLeftOperatorStack()
    }
    
    func isNumberInInfix(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        
        if operators.contains(item) {
            return false
        }
        return true
    }
    
    func addToPostfix(member: String) {
        postfix.append(member)
    }
    
    func addToOperatorStack(of index: String) {
        operatorsStack.append(index)
    }
    
    func changeToOperatorsEnum(_ item: String) -> Operator {
        let lastStackOperator = item
        
        switch lastStackOperator {
        case "+":
            return Operator.plus
        case "−":
            return Operator.minus
        case "×":
            return Operator.multiply
        default:
            return Operator.divide
        }
    }
    
    func compareAndDecidePriority(lastStack: Operator, with input: Operator) {
        if lastStack < input {
            addToOperatorStack(of: input.operatorSymbol)
        } else if lastStack == input {
            addToPostfix(member: lastStack.operatorSymbol)
            operatorsStack.removeLast()
            addToOperatorStack(of: input.operatorSymbol)
        } else {
            while !operatorsStack.isEmpty {
                addToPostfix(member: lastStack.operatorSymbol)
                operatorsStack.removeLast()
            }
            addToOperatorStack(of: input.operatorSymbol)
        }
    }
    
    func processLeftOperatorStack() {
        while !operatorsStack.isEmpty {
            postfix.append(operatorsStack.removeLast())
        }
    }
}
