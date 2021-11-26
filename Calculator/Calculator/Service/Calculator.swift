import Foundation

class Calculator {
    weak private var delegate: CalculatorDelegate?
    
    private var currentOperator: String {
        didSet {
            delegate?.calculator(didChangeCurrentOperatorTo: currentOperator)
        }
    }
    
    private var currentOperand: String {
        didSet {
            delegate?.calculator(didChangeCurrentOperandTo: currentOperand)
        }
    }
    
    private var inputString: String
    
    private var hasSuffixOperator: Bool {
        return Operator.allCases.reduce(false) {
            $0 == inputString.hasSuffix(String($1.rawValue))
        }
    }
    
    private var hasDot: Bool {
        return currentOperand.contains(CalculatorSymbol.Dot)
    }
    
    init(currentOperator: String = String.empty,
         currentOperand: String = CalculatorSymbol.Zero,
         inputString: String = String.empty) {
        self.currentOperator = currentOperator
        self.currentOperand = currentOperand
        self.inputString = inputString
    }
    
    convenience init(delegate: CalculatorDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    private func resetCurrentData() {
        resetCurrentOperand()
        resetCurrentOperator()
        delegate?.calculatorDidClearAllData()
    }
    
}

// MARK: -Receive Event
extension Calculator {
    func operandButtonTouched(_ operand: String) {
        changeCurrentOperand(text: operand)
    }
    
    func operatorButtonTouched(_ operator: String) {

        if currentOperand == CalculatorSymbol.Zero {
            updateCurrentOperator(text: `operator`)
            appendOperatorToInputString()
            return
        }

        delegate?.calculatorDidReceiveValidExpression()
        updateCurrentOperator(text: `operator`)
        appendOperandToInputString()
        appendOperatorToInputString()
        resetCurrentOperand()
    }
    
    func allClearButtonTouched() {
        resetInputString()
        resetCurrentData()
    }
    
    func clearEntryButtonTouched() {
        resetCurrentOperand()
    }
    
    func plusMinusButtonTouched() {
        togglePlusMinus()
    }
    
    func dotButtonTouched() {
        insertDot()
    }
    
    func resultButtonTouched() {
        guard currentOperator.isEmpty == false else { return }

        delegate?.calculatorDidReceiveValidExpression()
        appendOperandToInputString()
        resetCurrentOperator()

        var formula = ExpressionParser.parse(from: inputString)
        let result = formula.result()
        currentOperand = DecimalNumberFormatter.shared.string(for: result) ?? CalculatorSymbol.Error
    }
}

// MARK: Private Method
extension Calculator {
    private func changeCurrentOperand(text: String) {
        var currentText = currentOperand
        
        guard currentText != CalculatorSymbol.Zero ||
                text != CalculatorSymbol.DoubleZero else {
                    return
                }
        
        if currentText == CalculatorSymbol.Zero {
            currentText = text
        } else {
            currentText += text
        }
        
        if hasDot == false {
            let numberLabelText = currentText.removedComma()
            let number = Double(numberLabelText)
            currentOperand = DecimalNumberFormatter.shared.string(for: number) ?? CalculatorSymbol.Zero
        } else {
            currentOperand = currentText
        }
    }
    
    private func updateCurrentOperator(text operator: String) {
        currentOperator = `operator`
    }
    
    private func togglePlusMinus() {
        if currentOperand.hasPrefix(CalculatorSymbol.Minus) == true {
            currentOperand = currentOperand.replacingOccurrences(of: CalculatorSymbol.Minus, with: String.empty)
        } else {
            currentOperand = CalculatorSymbol.Minus + currentOperand
        }
    }
    
    private func resetCurrentOperand() {
        currentOperand = CalculatorSymbol.Zero
    }
    
    private func resetCurrentOperator() {
        currentOperator = String.empty
    }
    
    private func resetInputString() {
        inputString = String.empty
    }
    
    private func insertDot() {
        if hasDot == false {
            currentOperand += CalculatorSymbol.Dot
        }
    }
    
    private func appendOperandToInputString() {
        inputString.append(currentOperand.removedComma())
    }
        
    private func appendOperatorToInputString() {
        if hasSuffixOperator {
            inputString.removeLast()
        }

        inputString.append(currentOperator)
    }
}
