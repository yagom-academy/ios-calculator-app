import UIKit

struct CalculatorChecker {
    private var enteringNumber = Sign.empty
    private var calculationExpression: String = Sign.empty
    private var labelUpdateClosure: (String) -> Void
    
    init(updateClosure closure: @escaping (String) -> Void) {
        self.labelUpdateClosure = closure
    }
    
    mutating func appendingNumber(_ numberPad: String) {
        guard hasCurrentInput(enteringNumber) else {
            enteringNumber = numberPad
            labelUpdateClosure(enteringNumber)
            return
        }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: numberPad)
        enteringNumber = convertToDecimal(for: addedEnteringNumber)
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func appendingExpression(_ operatorText: String) {
        let convertedNumber = convertToDecimal(for: enteringNumber.convertToDouble())
        calculationExpression += (operatorText + convertedNumber)
        enteringNumber = Sign.empty
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func appendingZero(_ zeroPad: String) {
        if isZero(enteringNumber) || hasCurrentInput(enteringNumber) == false {
            enteringNumber = Sign.zero
            return
        }
        
        if hasDot(enteringNumber) {
            enteringNumber += zeroPad
            labelUpdateClosure(enteringNumber)
            return
        }
        
        appendingNumber(zeroPad)
    }
    
    mutating func appendingDot() {
        guard hasDot(enteringNumber) == false else { return }
        
        enteringNumber = hasCurrentInput(enteringNumber) ? (enteringNumber + Sign.dot) : "0."
        labelUpdateClosure(enteringNumber)
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
    
    func convertToDecimal(for number: Double) -> String {
        let numberFormatter =  NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(for: number) ?? Sign.zero
    }
}
