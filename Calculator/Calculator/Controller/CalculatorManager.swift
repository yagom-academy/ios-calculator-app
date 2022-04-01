
import Foundation

protocol CalculatorManagerable {
    func editInputNumber(current: String, input: String) -> String
    func editOperandSign(current: String) -> String
    func editCalculatorResult(current: Double, numberFormatter: NumberFormatter) -> String
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
            if current == CalculatorConstant.zero {
                result = input
            } else {
                result = current + input
            }
        }
        
        return result
    }
    
    func editOperandSign(current: String) -> String {
        guard current != CalculatorConstant.zero else {
            return current
        }
        
        var result = current
        
        if current.contains(CalculatorConstant.negativeSign) {
            result.removeFirst()
        } else {
            result.insert(CalculatorConstant.negativeSign, at: result.startIndex)
        }
        return result
    }
    
    func editCalculatorResult(current: Double, numberFormatter: NumberFormatter) -> String {
        var result = ""
        
        if current.isNaN {
           result = CalculatorConstant.nanResult
        } else if cannotUseNumberFormatter(current) {
            let integerLength = String(current).components(separatedBy: CalculatorConstant.dotSymbol)[0].count
            result = String(format: "%.\(String(CalculatorConstant.maximumDecimalCount - integerLength))f", current)
        } else {
            guard let numberFormattedResult = numberFormatter.string(for: current) else { return CalculatorConstant.zero }
            result = numberFormattedResult
        }
        
        return result
    }
    
    private func cannotUseNumberFormatter(_ result: Double) -> Bool {
        let componentsByDecimalSeperator = String(result).components(separatedBy: CalculatorConstant.dotSymbol)
        let integerLength = componentsByDecimalSeperator[0].count
        let decimalLength = componentsByDecimalSeperator[1].count
        
        return decimalLength >= 16 && integerLength + decimalLength < CalculatorConstant.maximumDecimalCount
    }
    
}
