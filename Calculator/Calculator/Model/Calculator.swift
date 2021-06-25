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
        var tempStack = Stack<String>()
        var postfix = [String]()

        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            moveNonPriorOperator(than: element, from: &tempStack, to: &postfix)
            tempStack.push(element)
        }
        while let top = tempStack.pop() {
            postfix.append(top)
        }
        return postfix
    }

    func calculatePostfix() throws -> Double? {
        let postfix = convertToPostfix()
        var tempStack = Stack<Double>()

        for element in postfix {
            if let number = Double(element) {
                tempStack.push(number)
                continue
            }
            guard let rhs = tempStack.pop(), let lhs = tempStack.pop() else {
                throw ErrorCases.emptyStackAccess
            }
            guard let `operator` = Operator(rawValue: element) else {
                throw ErrorCases.invalidElement
            }
            let result = try `operator`.calculate(lhs: lhs, rhs: rhs)
            tempStack.push(result)
        }
        return tempStack.pop()
    }
}
