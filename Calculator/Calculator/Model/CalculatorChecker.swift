import Foundation

struct CalculatorChecker {
    private(set) var enteringNumber = Sign.empty
    private(set) var calculationExpression: String = Sign.empty
    private var labelUpdateClosure: (String) -> Void
    
    private var hasCurrentInput: Bool {
        if enteringNumber == Sign.empty || enteringNumber == Sign.space {
            return false
        }
        return true
    }
    private var hasDot: Bool {
        return enteringNumber.contains(Sign.dot) ? true : false
    }
    
    init(updateClosure closure: @escaping (String) -> Void) {
        self.labelUpdateClosure = closure
    }
    
    mutating func appendingNumber(_ numberPad: String) {
        guard hasCurrentInput else {
            enteringNumber = numberPad
            labelUpdateClosure(enteringNumber)
            return
        }
        enteringNumber += numberPad
        enteringNumber = enteringNumber.convertToDecimal()
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func appendingExpression(_ operatorText: String, _ operandText: String) {
        calculationExpression += (operatorText + operandText)
        enteringNumber = Sign.empty
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func appendingZero(_ zeroPad: String) {
        guard isZero(enteringNumber) == false && hasCurrentInput else {
            enteringNumber = Sign.zero
            return
        }
        
        guard hasDot else {
            appendingNumber(zeroPad)
            return
        }

        enteringNumber += zeroPad
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func appendingDot() {
        guard hasDot == false else { return }
        
        enteringNumber = hasCurrentInput ? (enteringNumber + Sign.dot) : Sign.zeroDot
        labelUpdateClosure(enteringNumber)
    }
    
    func appendingDot(_ currentText: String) -> String {
        if currentText == Sign.empty {
            return Sign.zero + Sign.dot
        }
        return currentText + Sign.dot
    }
    
    mutating func changeSign() {
        guard enteringNumber.contains(Sign.minus) == false else {
            enteringNumber = enteringNumber.replacingOccurrences(of: Sign.minus, with: Sign.empty)
            labelUpdateClosure(enteringNumber)
            return
        }
        enteringNumber = (Sign.minus + enteringNumber)
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func initialState() {
        calculationExpression = Sign.empty
        initialEnteringNumber()
    }
    
    mutating func initialEnteringNumber() {
        enteringNumber = Sign.empty
        labelUpdateClosure(enteringNumber)
    }
    
    mutating func calculate(_ operatorText: String) {
        let formattedNumber = enteringNumber.convertToDecimal()
        
        calculationExpression += (operatorText + formattedNumber)
        
        var formula = ExpressionParser.parse(from: calculationExpression.split(separator: ",").joined())
        
        initialState()
        enteringNumber = Sign.space
        labelUpdateClosure(String(formula.result()).convertToDecimal())
    }
    
    func isZero(_ currentText: String) -> Bool {
        return currentText == Sign.zero ? true : false
    }
}
