import Foundation

class Calculator {
    private var currentInput = ""
    private var infixNotation = [String]()

    private func moveNonPrecedentOperator(than currentOperator: Operator,
                                      from operatorStack: inout Stack<Operator>,
                                      to postfix: inout [String]) throws{
        while let top = operatorStack.top, currentOperator <= top {
            guard let top = operatorStack.pop() else {
                throw ErrorCases.emptyStackAccess
            }
            postfix.append(top.rawValue)
        }
    }

    private func convertToPostfix() throws -> [String] {
        var operatorStack = Stack<Operator>()
        var postfix = [String]()

        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            guard let currentOperator = Operator(rawValue: element) else {
                throw ErrorCases.invalidElement
            }
            try moveNonPrecedentOperator(than: currentOperator, from: &operatorStack, to: &postfix)
            operatorStack.push(currentOperator)
        }
        while let top = operatorStack.pop() {
            postfix.append(top.rawValue)
        }
        return postfix
    }

    func calculatePostfix() throws -> Double? {
        let postfix = try convertToPostfix()
        var numberStack = Stack<Double>()

        for element in postfix {
            if let number = Double(element) {
                numberStack.push(number)
                continue
            }
            guard let rhs = numberStack.pop(), let lhs = numberStack.pop() else {
                throw ErrorCases.emptyStackAccess
            }
            guard let `operator` = Operator(rawValue: element) else {
                throw ErrorCases.invalidElement
            }
            let result = try `operator`.calculate(lhs: lhs, rhs: rhs)
            numberStack.push(result)
        }
        return numberStack.pop()
    }
}
