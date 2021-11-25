import Foundation

class Calculator {
    weak private var delegate: CalculatorDelegate?
    
    convenience init(delegate: CalculatorDelegate) {
        self.init()
        self.delegate = delegate
    }
}

// MARK: -Receive Event
extension Calculator {
    func operandButtonTouched(_ operand: String) {
//        guard let operand = sender.currentTitle else { return }
//        
//        changeOperandLabel(text: operand)
    }
    
    func operatorButtonTouched(_ operator: String) {
//        guard let `operator` = sender.currentTitle else { return }
//        guard let currentText = operandLabel.text else { return }
//
//        if currentText == CalculatorSymbol.Zero {
//            updateOperatorLabel(text: `operator`)
//            appendOperatorToInputString()
//            return
//        }
//
//        addExpressionStackView()
//        updateOperatorLabel(text: `operator`)
//        appendOperandToInputString()
//        appendOperatorToInputString()
//        resetOperandLabel()
    }
    
    func allClearButtonTouched() {
//        initializeView()
//        resetInputString()
    }
    
    func clearEntryButtonTouched() {
//        resetOperandLabel()
    }
    
    func plusMinusButtonTouched() {
//        guard operandLabel.text != CalculatorSymbol.Zero else {
//            return
//        }
//
//        togglePlusMinus()
    }
    
    func dotButtonTouched() {
        //insertDot()
    }
    
    func resultButtonTouched() {
//        guard let `operator` = operatorLabel.text,
//              `operator` != String.empty else { return }
//
//        addExpressionStackView()
//        appendOperandToInputString()
//        resetOperatorLabel()
//
//        var formula = ExpressionParser.parse(from: inputString)
//        let result = formula.result()
//        operandLabel.text = numberFormatter.string(for: result)
    }
}
