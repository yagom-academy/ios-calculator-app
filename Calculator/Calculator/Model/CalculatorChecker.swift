import Foundation

struct CalculatorChecker {
    private var enteringNumber = Sign.empty
    private var calculationExpression: String = Sign.empty
    
    mutating func appendingNumber(_ numberPad: String) -> String {
        if !hasCurrentInput(enteringNumber) {
            enteringNumber = numberPad
            return enteringNumber
        }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: numberPad)
        enteringNumber = convertToDecimal(for: addedEnteringNumber)
        return enteringNumber
    }
    
    
    func hasCurrentInput(_ currentText: String) -> Bool {
        if currentText == Sign.empty || currentText == Sign.space {
            return false
        }
        return true
    }
    
    func hasDot(_ currentText: String) -> Bool {
        return currentText.contains(Sign.dot) ? true : false
    }
    
    func appendingDot(_ currentText: String) -> String {
        if currentText == Sign.empty {
            return Sign.zero + Sign.dot
        }
        return currentText + Sign.dot
    }
    
    func isZero(_ currentText: String) -> Bool {
        return currentText == Sign.zero ? true : false
    }
    
    func changedSign(_ currentText: String) -> String {
        if currentText.contains(Sign.minus) {
            return currentText.replacingOccurrences(of: Sign.minus, with: Sign.empty)
        }
        return (Sign.minus + currentText)
    }
    
    func calculate(with expression: String) -> Double {
        var formula = ExpressionParser.parse(from: expression.split(separator: ",").joined())
        return formula.result()
    }
    
    private func convertToDecimal(for number: Double) -> String {
        let numberFormatter =  NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(for: number) ?? Sign.zero
    }
}
