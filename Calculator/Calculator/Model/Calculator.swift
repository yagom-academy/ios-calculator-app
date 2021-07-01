import Foundation

enum CalculatorError: Error {
    case dividedByZero
    case invalidNumber
    case invalidOperator
    case noResult
}

class Calculator {
    var result = ""
//    private let postfix = Postfix()
    
    static func checkDividedNumber(second: Double) throws {
        let invalidNumber = Double(0)
        guard second != invalidNumber else {
            throw CalculatorError.dividedByZero
        }
    }
    
    static func determineCalculationWay(first: String, second: String, arithmethicOperator: String) throws -> Double {
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
    
    func checkInteger(number: String?) throws -> Bool {
        guard let unwrappedNumber = number else {
            throw CalculatorError.noResult
        }
        return unwrappedNumber.split(separator: ".").last.map{ String($0) } == "0"
    }
    
    func roundDown(number: String?, decimalPlace: Int) throws -> String? {
        guard let unwrappedNumber = number, let convertedNumber = Double(unwrappedNumber) else {
            throw CalculatorError.invalidNumber
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = decimalPlace
        let roundDownResult = numberFormatter.string(for: convertedNumber)
        return roundDownResult
    }
    
    func returnCalculationResult() throws -> String? {
        let calculateResult = try Postfix.calculatePostfix()
        if try checkInteger(number: calculateResult) {
            return try roundDown(number: calculateResult, decimalPlace: 0)
        }
        return calculateResult
    }
}
