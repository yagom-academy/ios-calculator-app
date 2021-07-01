import Foundation

class Calculator {
    private var infixNotation = [String]()

    private func moveNonPrecedentOperator(
        than currentOperator: Operator,
        from operatorStack: Stack<Operator>,
        to postfix: [String]) throws -> (Stack<Operator>, [String])
    {
        var operatorStack = operatorStack
        var postfix = postfix
        while let top = operatorStack.top, currentOperator <= top {
            guard let top = operatorStack.pop() else {
                throw CalculatorError.emptyStackAccess
            }
            postfix.append(top.rawValue)
        }
        return (operatorStack, postfix)
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
                throw CalculatorError.invalidElement
            }
            (operatorStack, postfix) = try moveNonPrecedentOperator(than: currentOperator, from: operatorStack, to: postfix)
            operatorStack.push(currentOperator)
        }
        while let top = operatorStack.pop() {
            postfix.append(top.rawValue)
        }
        return postfix
    }

    func calculate() throws -> Double? {
        let postfix = try convertToPostfix()
        var numberStack = Stack<Double>()
        
        for element in postfix {
            if let number = Double(element) {
                numberStack.push(number)
                continue
            }
            guard let rhs = numberStack.pop(), let lhs = numberStack.pop() else {
                throw CalculatorError.emptyStackAccess
            }
            guard let currentOperator = Operator(rawValue: element) else {
                throw CalculatorError.invalidElement
            }
            let result = try currentOperator.calculate(leftOperand: lhs, rightOperand: rhs)
            numberStack.push(result)
        }
        return numberStack.pop()
    }
    
    func calculateAndFormat() throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        
        do {
            guard let result = try calculate() else {
                throw CalculatorError.invalidResult
            }
            guard let formattedAnswer = numberFormatter.string(for: result) else {
                throw CalculatorError.failedToFormat
            }
            return formattedAnswer
        } catch CalculatorError.dividedByZero {
            return "NaN"
        }
    }
    
    func replaceInfix(with infix: [String]) {
        infixNotation = infix
    }
}
