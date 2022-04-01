
import Foundation

protocol CalculatorManagerable {
    func editInputNumber(current: String, input: String) -> String
}

struct CalculatorManager : CalculatorManagerable {
    func editInputNumber(current: String, input: String) -> String {
        var result: String = current
        
        switch input {
        case CalculatorConstant.dotSymbol:
            if current.contains(CalculatorConstant.dotSymbol) == false {
                result = current + input
            }
        case CalculatorConstant.doubleZero:
            if current != CalculatorConstant.zero {
                result = current + input
            }
        default:
            if current != CalculatorConstant.zero {
                result = current + input
            }
        }
        
        return result
    }
}
