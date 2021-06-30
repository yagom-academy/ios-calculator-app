import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case invalidNumber
    case invalidOperator
}

class Calculator {
    var numberStack = Stack<String>()
    var result = ""
    let postfix = Postfix()
    
    func checkDividedNumber(second: Double) throws {
        let invalidNumber = Double(0)
        guard second != invalidNumber else {
            throw CalculatorError.dividedByZero
        }
    }
    
    func determineCalculationWay(first: String, second: String, arithmethicOperator: String) throws -> Double {
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
    
    func returnCalculationResult() throws -> String? {
        let calculateResult = try postfix.calculatePostfix()
        return calculateResult
    }
}
