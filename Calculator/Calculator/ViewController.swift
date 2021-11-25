import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var operandLabel: UILabel!
    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var expressionsStackView: UIStackView!
    @IBOutlet weak private var expressionScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    
    private var inputString: String = ""
    private var hasSuffixOperator: Bool {
        return Operator.allCases.reduce(false) {
            $0 == inputString.hasSuffix(String($1.rawValue))
        }
    }
    private var hasDot: Bool {
        let text = operandLabel.text ?? ""
        
        return text.contains(".")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        initNumberFormatter()
    }
    
    private func initializeView() {
        resetOperandLabel()
        resetOperatorLabel()
        removeSubviewsFromStackView()
    }
    
    private func initNumberFormatter() {
        numberFormatter.roundingMode = .ceiling
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
}

// MARK: - IBAction
extension ViewController {
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeOperandLabel(text: operand)
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        guard let currentText = operandLabel.text else { return }
        
        if currentText == "0" {
            updateOperatorLabel(text: `operator`)
            appendOperatorToInputString()
            return
        }
        
        addExpressionStackView()
        updateOperatorLabel(text: `operator`)
        appendOperandToInputString()
        appendOperatorToInputString()
        resetOperandLabel()
    }
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        initializeView()
        resetInputString()
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction private func touchUpPlusMinusButton(_ sender: UIButton) {
        guard operandLabel.text != "0" else {
            return
        }
        
        operandLabel.text = togglePlusMinus()
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        insertDot()
    }
    
    @IBAction private func touchUpResultButton(_ sender: UIButton) {
        guard let `operator` = operatorLabel.text,
              `operator` != "" else { return }
        
        addExpressionStackView()
        appendOperandToInputString()
        resetOperatorLabel()
        
        var formula = ExpressionParser.parse(from: inputString)
        let result = formula.result()
        operandLabel.text = numberFormatter.string(for: result)
    }
}

// MARK: - View Method
extension ViewController {
    
    private func changeOperandLabel(text: String) {
        var currentText = operandLabel.text ?? "0"
        
        guard currentText != "0" ||
              text != "00" else {
                  return
        }
        
        if currentText == "0" {
            currentText = text
        } else {
            currentText += text
        }
        
        if hasDot == false {
            let numberLabelText = removeComma(text: currentText)
            let number = Double(numberLabelText)
            operandLabel.text = numberFormatter.string(for: number)
        } else {
            operandLabel.text = currentText
        }
    }
    
    private func insertDot() {
        let dot = "."
        
        if hasDot == false {
            let currentText = operandLabel.text ?? "0"
            
            operandLabel.text = currentText + dot
        }
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetInputString() {
        inputString = String()
    }
    
    private func updateOperandsLabel(text operands: String) {
        operandLabel.text = operands
    }
    
    private func updateOperatorLabel(text operator: String) {
        operatorLabel.text = `operator`
    }
    
    private func addExpressionStackView() {
        let `operator` = makeLabel(with: operatorLabel.text)
        let operand = makeLabel(with: operandLabel.text)
        let expressionStackView = makeExpressionStackView(operator: `operator`,
                                                          operand: operand)
        
        expressionsStackView.addArrangedSubview(expressionStackView)
        scrollToBottom(expressionScrollView)
    }
    
    private func removeSubviewsFromStackView() {
        expressionsStackView.arrangedSubviews.forEach{$0.removeFromSuperview()}
    }
    
    private func makeExpressionStackView(operator: UILabel,
                                         operand: UILabel) -> UIStackView {
        let expression = UIStackView()
        let spacing: CGFloat = 8
        
        expression.axis = .horizontal
        expression.spacing = spacing
        expression.addArrangedSubview(`operator`)
        expression.addArrangedSubview(operand)
        
        return expression
    }
    
    private func makeLabel(with text: String?) -> UILabel {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = text
        
        return label
    }
        
    private func scrollToBottom(_ scroll: UIScrollView) {
        scroll.layoutIfNeeded()
        let offsetY = scroll.contentSize.height - scroll.bounds.size.height
        let bottomOffset = CGPoint(x: 0, y: offsetY)
        scroll.setContentOffset(bottomOffset, animated: true)
    }
}

//MARK: - Method

extension ViewController {
    private func appendOperandToInputString() {
        guard let numberText = operandLabel.text else { return }
        let number = removeComma(text: numberText)
        
        inputString.append(number)
    }
        
    private func appendOperatorToInputString() {
        guard let `operator` = operatorLabel.text else { return }
        
        if hasSuffixOperator {
            inputString.removeLast()
        }
        
        inputString.append(`operator`)
    }
    
    private func removeComma(text: String?) -> String {
        return text?.replacingOccurrences(of: ",", with: "") ?? ""
    }
    
    private func togglePlusMinus() -> String {
        var currentText = operandLabel.text ?? "0"
        let minusSign = "-"
        
        if currentText.hasPrefix(minusSign) == true {
            currentText = currentText.replacingOccurrences(of: minusSign , with: "")
        } else {
            currentText = minusSign + currentText
        }
        
        return currentText
    }
}
