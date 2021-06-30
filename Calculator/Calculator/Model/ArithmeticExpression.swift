import Foundation

class Infix {
    var infix: [String] = []
}

class Postfix {
    var postfix: [String] = []
    var operatorsStack = Stack<String>()
    var numberStack = Stack<String>()
    
    func separateInfix(from infix: Array<String>) {
        infix.forEach {
            if isOperator(item: $0) {
                addToPostfix(item: $0)
            } else if operatorsStack.isEmpty() {
                addToOperatorStack(item: $0)
            } else {
                comparePriority(with: changeToOperatorsEnum($0))
            }
        }
        processLeftOperatorStack()
    }
    
    func isOperator(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        return !operators.contains(item)
    }
    
    func addToPostfix(item: String) {
        postfix.append(item)
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
    
    func comparePriority(with input: Operator?) {
        guard let unwrappedOperatrosStack = operatorsStack.top() else { return }
        let lastOfOperatorStack = changeToOperatorsEnum(unwrappedOperatrosStack)
        guard let unwrappedLastOfOperatorStack = lastOfOperatorStack, let unwrappedInput = input else { return }
        if unwrappedLastOfOperatorStack < unwrappedInput {
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else if unwrappedLastOfOperatorStack == unwrappedInput {
            addToPostfix(item: unwrappedLastOfOperatorStack.operatorSymbol)
            operatorsStack.pop()
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        } else {
            processLeftOperatorStack()
            addToOperatorStack(item: unwrappedInput.operatorSymbol)
        }
    }
    
    func processLeftOperatorStack() {
        while !operatorsStack.isEmpty() {
            guard let leftItem = operatorsStack.pop() else {
                return
            }
            postfix.append(leftItem)
        }
    }
    
    func calculatePostfix() throws -> String? {
        for item in postfix {
            if isOperator(item: item) {
                numberStack.push(item: item)
            } else {
                guard let first = numberStack.pop(), let second = numberStack.pop() else {
                    throw CalculatorError.invalidNumber
                }
                let calculateResult = try Calculator.determineCalculationWay(first: first, second: second, arithmethicOperator: item)
                numberStack.push(item: String(calculateResult))
            }
        }
        return numberStack.pop()
    }
}
