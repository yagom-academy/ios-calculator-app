import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    let calculator = Calculator()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    private func setOperandLabel(to string: String?) {
        operandLabel.text = string
    }
    
    private func setOperatorLabel(to string: String?) {
        operatorLabel.text = string
    }
    
    private func initOperatorAndOperandLabel() {
        setOperatorLabel(to: nil)
        setOperandLabel(to: "0")
    }
    
    private func isOperandLabelZero() -> Bool {
        if operandLabel.text == "0" { return true }
        
        return false
    }
    
    private func inputNumber(by key: NumericKeypad) {
        guard var operand = operandLabel.text else { return }
        let keyNumber = key.rawValue
        
        if keyNumber == ".", operand.contains(".") {
            return
        }
        
        if keyNumber == "0" || keyNumber == "00",
           isOperandLabelZero() {
            return
        }
        
        if (isOperandLabelZero() && keyNumber != ".") ||
            calculator.isCalculateCompleted == true {
            operand = keyNumber
            calculator.isCalculateCompleted = false
        } else {
            operand += keyNumber
        }
        
        setOperandLabel(to: operand)
    }
    
    private func makeHistoryLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func addHistoryStackView(operatorText: String?, operandText: String?) {
        guard let operand = operandText,
              let convertedOperand = Double(operand.replacingOccurrences(of: "−", with: "-")) else { return }
        
        let historyLabels: [UIView] = [
            makeHistoryLabel(text: operatorText),
            makeHistoryLabel(text: numberFormatter.string(from: convertedOperand as NSNumber))
        ]
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        historyLabels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        historyStackView.addArrangedSubview(stackView)
        historyScrollView.moveToBottom()
    }
    
    private func inputOperator(by key: NumericKeypad) {
        let currentOperator = key.rawValue
        
        if isOperandLabelZero() {
            setOperatorLabel(to: currentOperator)
            return
        }
        
        guard let operand = operandLabel.text,
              operand.last != "." else { return }
        
        if calculator.formula == "" {
            addHistoryStackView(operatorText: nil, operandText: operand)
            calculator.addFormula(operand)
        } else {
            addHistoryStackView(operatorText: currentOperator, operandText: operand)
            calculator.addFormula(currentOperator + operand)
        }
        
        setOperatorLabel(to: currentOperator)
        setOperandLabel(to: "0")
    }
    
    private func changeOperandSign() {
        guard var operand = operandLabel.text else { return }
        
        if isOperandLabelZero() { return }
        
        if operand.first != "−" {
            operand = "−" + operand
        } else {
            operand = String(operand.dropFirst())
        }
        
        setOperandLabel(to: operand)
    }
    
    private func clearEntry() {
        if isOperandLabelZero() { return }
        
        setOperandLabel(to: "0")
    }
    
    private func clearAll() {
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        initOperatorAndOperandLabel()
        calculator.initFormula()
    }
    
    private func showCalculationResult() {
        do {
            let result = try calculator.calculate()
            setOperandLabel(to: numberFormatter.string(from: result as NSNumber))
        } catch CalculatorError.divisionByZero {
            setOperandLabel(to: numberFormatter.notANumberSymbol)
        } catch {
            return
        }
        
        setOperatorLabel(to: nil)
    }
    
    private func inputEqual() {
        guard let operand = operandLabel.text,
              let currentOperator = operatorLabel.text,
              calculator.formula != "" else { return }
        
        addHistoryStackView(operatorText: currentOperator, operandText: operand)
        calculator.addFormula(currentOperator + operand)
    }
    
    @IBAction private func touchUpCalculatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle,
              let key = NumericKeypad(rawValue: buttonTitle) else { return }
        
        switch key {
        case _ where NumericKeypad.numKeys.contains(key):
            inputNumber(by: key)
        case _ where NumericKeypad.operatorKeys.contains(key):
            inputOperator(by: key)
        case .equal:
            inputEqual()
            showCalculationResult()
        case .ac:
            clearAll()
        case .ce:
            clearEntry()
        case .plusMinus:
            changeOperandSign()
        default:
            return
        }
    }
}
