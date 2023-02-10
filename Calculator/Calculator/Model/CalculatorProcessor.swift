final class CalculatorProcessor {
    var enteringNumberObservable: Observable<String> = Observable(Sign.empty)
    private(set) var calculationExpression: String = Sign.empty
    
    var enteringNumber: String {
        get {
            return enteringNumberObservable.value
        }
        set {
            enteringNumberObservable.value = newValue
        }
    }
    
    var isEmpty: Bool {
        return enteringNumber.isEmpty ? true : false
    }
    
    var hasSpace: Bool {
        return enteringNumber == Sign.space ? true : false
    }
    
    private var hasCurrentInput: Bool {
        if isEmpty || hasSpace {
            return false
        }
        return true
    }
    
    private var hasDot: Bool {
        return enteringNumber.contains(Sign.dot) ? true : false
    }
    
    func appendingNumber(_ numberPad: String) {
        guard hasCurrentInput else {
            enteringNumber = numberPad
            return
        }
        
        enteringNumber += numberPad
        enteringNumber = enteringNumber.convertToDecimal()
    }
    
    func appendingExpression(_ operatorText: String, _ operandText: String = "") {
        calculationExpression += (operatorText + operandText)
        enteringNumber = Sign.empty
    }
    
    func appendingZero(_ zeroPad: String) {
        guard isZero(enteringNumber) == false && hasCurrentInput else {
            enteringNumber = Sign.zero
            return
        }
        
        guard hasDot else {
            appendingNumber(zeroPad)
            return
        }

        enteringNumber += zeroPad
    }
    
    func appendingDot() {
        guard hasDot == false else { return }
        
        enteringNumber = hasCurrentInput ? (enteringNumber + Sign.dot) : Sign.zeroDot
    }

    func changeSign() {
        guard enteringNumber.contains(Sign.minus) == false else {
            enteringNumber = enteringNumber.replacingOccurrences(of: Sign.minus, with: Sign.empty)
            return
        }
        
        enteringNumber = (Sign.minus + enteringNumber)
    }
    
    func calculate(_ operatorText: String) {
        let formattedNumber = enteringNumber.convertToDecimal()
        
        calculationExpression += (operatorText + formattedNumber)
        
        var formula = ExpressionParser.parse(from: calculationExpression.split(separator: ",").joined())
        
        initialState()
        enteringNumber = Sign.space
        enteringNumberObservable.closure?(String(formula.result()).convertToDecimal())
    }
    
    func isZero(_ currentText: String) -> Bool {
        return currentText == Sign.zero ? true : false
    }
    
    func initialState() {
        calculationExpression = Sign.empty
        initialEnteringNumber()
    }
    
    func initialEnteringNumber() {
        enteringNumber = Sign.empty
    }
}
