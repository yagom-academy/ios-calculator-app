import Foundation

class Calculator {
    private var currentInput = ""
    private var infixNotation = [String]()
    
    private func isPriorOperator(this first: String, to second: String) -> Bool {
        let highPriorityOperator = Set(["*", "/"])
        let lowPriorityOperator = Set(["+", "-"])
        return highPriorityOperator.contains(first) && lowPriorityOperator.contains(second)
    }
    
    private func moveNonPriorOperator(than element: String, from stack: inout Stack<String>, to postfix: inout [String]) {
        while let top = stack.top, !isPriorOperator(this: element, to: top) {
            guard let top = stack.pop() else {
                continue
            }
            postfix.append(top)
        }
    }

    func convertToPostfix() -> [String] {
        var operatorStack = Stack<String>()
        var postfix = [String]()

        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            moveNonPriorOperator(than: element, from: &operatorStack, to: &postfix)
            operatorStack.push(element)
        }
        while let top = operatorStack.pop() {
            postfix.append(top)
        }
        return postfix
    }

    func calculatePostfix() throws -> Double? {
        let postfix = convertToPostfix()
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
