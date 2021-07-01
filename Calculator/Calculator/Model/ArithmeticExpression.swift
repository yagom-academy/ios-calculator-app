import Foundation

class Infix {
    private var infix: [String] = []
}

class Postfix {
    private static var postfix: [String] = []
    private var operatorsStack = Stack<String>()
    private static var numberStack = Stack<String>()
    
    func separateInfix(from infix: Array<String>) {
        infix.forEach {
            if Postfix.isOperator(item: $0) {
                addToPostfix(item: $0)
            } else if operatorsStack.isEmpty() {
                addToOperatorStack(item: $0)
            } else {
                comparePriority(with: changeOperatorType($0))
            }
        }
        processLeftOperatorStack()
    }
    
    private static func isOperator(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        return !operators.contains(item)
    }
    
    private func addToPostfix(item: String) {
        Postfix.postfix.append(item)
    }
    
    private func addToOperatorStack(item: String) {
        operatorsStack.push(item: item)
    }
    
    private func changeOperatorType(_ item: String) -> Operator? {
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
    
    private func comparePriority(with input: Operator?) {
        guard let unwrappedOperatrosStack = operatorsStack.top() else { return }
        let lastOfOperatorStack = changeOperatorType(unwrappedOperatrosStack)
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
    
    private func processLeftOperatorStack() {
        while !operatorsStack.isEmpty() {
            guard let leftItem = operatorsStack.pop() else {
                return
            }
            Postfix.postfix.append(leftItem)
        }
    }
    
    static func calculatePostfix() throws -> String? {
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
