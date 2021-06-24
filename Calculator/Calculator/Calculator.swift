import Foundation

class Calculator {
    private var currentInput = ""
    private var infixNotation = [String]()
    
    private func isPriorOperator(this first: String, to second: String) -> Bool {
        let highPriorityOperator = Set(["*", "/"])
        let lowPriorityOperator = Set(["+", "-"])
        return highPriorityOperator.contains(first) && lowPriorityOperator.contains(second)
    }
    
    private func moveNonPriorOperator(than element: String, from stack: inout Stack, to postfix: inout [String]) {
        while let top = stack.top, !isPriorOperator(this: element, to: top) {
            guard let top = stack.pop() else {
                continue
            }
            postfix.append(top)
        }
    }

    func convertToPostfix() -> [String] {
        var tempStack = Stack()
        var postfix = [String]()

        for element in infixNotation {
            if let _ = Double(element) {
                postfix.append(element)
                continue
            }
            moveNonPriorOperator(than: element, from: &tempStack, to: &postfix)
            tempStack.push(element: element)
        }
        while let top = tempStack.pop() {
            postfix.append(top)
        }
        return postfix
    }

    func calculatePostfix() throws -> String? {
        let postfix = convertToPostfix()
        var tempStack = Stack()

        for element in postfix {
            if let _  = Double(element) {
                tempStack.push(element: element)
                continue
            }
			if let operand2String = tempStack.pop(), let operand1String = tempStack.pop(),
               let operand2 = Double(operand2String), let operand1 = Double(operand1String) {
                var result: Double?
                switch element {
                case "+":
                    result = operand1 + operand2
                case "-":
                    result = operand1 - operand2
                case "*":
                    result = operand1 * operand2
                case "/":
					if operand2 == 0 {
						throw ErrorCases.dividedByZero
					}
                    result = operand1 / operand2
                default:
                    break
                }
                if let result = result {
                    tempStack.push(element: String(result))
                }
            }
        }
        return tempStack.pop()
    }
}
