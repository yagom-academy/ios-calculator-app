import Foundation

class Infix {
    var infix: [String] = []
}

class Postfix {
    var postfix: [String] = []
    var operatorsStack: [String] = []
    
    func separateInfix(from infix: Array<String>) {
        for item in infix {
            if isNumberInInfix(item: item) {
                addToPostfix(member: item)
            } else if operatorsStack.isEmpty {
                addToOperatorStack(of: item)
            } else {
                comparePriority(lastOfOperatorStack: changeToOperatorsEnum(operatorsStack.last!),
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
    
    func comparePriority(lastOfOperatorStack: Operator, with input: Operator) {
        if lastOfOperatorStack < input {
            addToOperatorStack(of: input.operatorSymbol)
        } else if lastOfOperatorStack == input {
            addToPostfix(member: lastOfOperatorStack.operatorSymbol)
            operatorsStack.removeLast()
            addToOperatorStack(of: input.operatorSymbol)
        } else {
            while !operatorsStack.isEmpty {
                addToPostfix(member: lastOfOperatorStack.operatorSymbol)
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
