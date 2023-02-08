struct CalculatorChecker {
    private(set) var enteringNumber = Sign.empty {
        didSet {
            labelUpdateClosure(enteringNumber)
        }
    }
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
            return
        }
        enteringNumber += numberPad
        enteringNumber = enteringNumber.convertToDecimal()
    }
    
    mutating func appendingExpression(_ operatorText: String, _ operandText: String) {
        calculationExpression += (operatorText + operandText)
        enteringNumber = Sign.empty
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
    }
    
    mutating func appendingDot() {
        guard hasDot == false else { return }
        
        enteringNumber = hasCurrentInput ? (enteringNumber + Sign.dot) : Sign.zeroDot
    }

    mutating func changeSign() {
        guard enteringNumber.contains(Sign.minus) == false else {
            enteringNumber = enteringNumber.replacingOccurrences(of: Sign.minus, with: Sign.empty)
            return
        }
        enteringNumber = (Sign.minus + enteringNumber)
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
    
    mutating func initialState() {
        calculationExpression = Sign.empty
        initialEnteringNumber()
    }
    
    mutating func initialEnteringNumber() {
        enteringNumber = Sign.empty
    }
}
