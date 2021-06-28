import Foundation

class Infix {
    var infix: [String] = []
}

class Postfix {
    var postfix: [String] = []
    var operatorsStack: [String] = []
    
    func separateInfix(from infix: Array<String>) {
        infix.forEach {
            if isNumberInInfix(item: $0) {
                addToPostfix(item: $0)
            } else if operatorsStack.isEmpty {
                addToOperatorStack(item: $0)
            } else {
                comparePriority(lastOfOperatorStack: changeToOperatorsEnum(operatorsStack.last!),
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
        postfix.append(item)
    }
    
    func addToOperatorStack(item: String) {
        operatorsStack.append(item)
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
            addToOperatorStack(item: input.operatorSymbol)
        } else if lastOfOperatorStack == input {
            addToPostfix(item: lastOfOperatorStack.operatorSymbol)
            operatorsStack.removeLast()
            addToOperatorStack(item: input.operatorSymbol)
        } else {
            while !operatorsStack.isEmpty {
                addToPostfix(item: lastOfOperatorStack.operatorSymbol)
                operatorsStack.removeLast()
            }
            addToOperatorStack(item: input.operatorSymbol)
        }
    }
    
    func processLeftOperatorStack() {
        while !operatorsStack.isEmpty {
            postfix.append(operatorsStack.removeLast())
        }
    }
}
