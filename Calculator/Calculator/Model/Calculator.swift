
import Foundation

class Calculator {
    var numberStack = [String]()
    var result = ""
    var postfix = Postfix()
    
    func isNumberInPostfix(item: String) -> Bool {
        let operators = ["+","−","×","÷"]
        
        if operators.contains(item) {
            return false
        }
        return true
    }
    
    func calculatePostfix(first: String, second: String, arithmethicOperator: String) -> Double {
        guard let first = Double(first) , let second = Double(second) else {
            return 10000000
        }
        switch arithmethicOperator {
        case "+":
            return first + second
        case "−":
            return first - second
        case "×":
            return first * second
        case "÷":
            return first / second
        default:
            return 10000000
        }
    }
    
    func returnCalculationResult() -> String {
        for item in postfix.postfix {
            if isNumberInPostfix(item: item) {
                numberStack.append(item)
            }else {
                let second = numberStack.removeLast()
                let first = numberStack.removeLast()
                let calculateResult = calculatePostfix(first: first, second: second, arithmethicOperator: item)
                numberStack.append(String(calculateResult))
            }
        }
        return numberStack.removeLast()
    }
//    func calculatePostfix(first: String, second: String, oper: String) -> Result<Double, Error> {
//        guard let first = Double(first) , let second = Double(second) else {
//            return .failure(CalculatorError.unknown)
//        }
//
//        switch oper {
//        case "+":
//            return .success(first + second)
//        case "−":
//            return .success(first - second)
//        case "×":
//            return .success(first * second)
//        case "÷":
//            return .success(first / second)
//        default:
//            return .failure(CalculatorError.unknown)
//        }
//    }
//
//    func returnCalculationResult() -> String {
//        for item in postfix.postfix {
//            if isNumberInPostfix(item: item) {
//                numberStack.append(item)
//            } else {
//                let second = numberStack.removeLast()
//                let first = numberStack.removeLast()
//                let calculateResult = calculatePostfix(first: first, second: second, oper: item)
//                numberStack.append(String(calculateResult))
//            }
//        }
//        return numberStack.removeLast()
//    }
}
