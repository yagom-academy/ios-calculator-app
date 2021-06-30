import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case invalidNumber
    case invalidOperator
}

class Calculator {
    var numberStack = Stack<String>()
    var result = ""
    var postfix = Postfix()
    
    func isOperatorInPostfix(item: String) -> Bool {
        let operators = ["+", "−", "×", "÷"]
        
        return !operators.contains(item)
    }
    
    func checkDividedNumber(second: Double) throws {
        let invalidNumber = Double(0)
        guard second != invalidNumber else {
            throw CalculatorError.dividedByZero
        }
    }
    
    func calculatePostfix(first: String, second: String, arithmethicOperator: String) throws -> Double {
        guard let first = Double(first) , let second = Double(second) else {
            throw CalculatorError.invalidNumber
        }
        switch arithmethicOperator {
        case "+":
            return first + second
        case "−":
            return first - second
        case "×":
            return first * second
        case "÷":
            try checkDividedNumber(second: second)
            return first / second
        default:
            throw CalculatorError.invalidOperator
        }
    }
    
    func returnCalculationResult(postfix: [String]) throws -> String? {
        for item in postfix {
            if isOperatorInPostfix(item: item) {
                numberStack.push(item: item)
            } else {
                guard let first = numberStack.pop(), let second = numberStack.pop() else {
                    throw CalculatorError.invalidNumber
                }
                let calculateResult = try calculatePostfix(first: first, second: second, arithmethicOperator: item)
                numberStack.push(item: String(calculateResult))
            }
        }
        return numberStack.pop()
    }
}
