import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private var formula = ""
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    private func setOperandLabel(to string: String? = "0") {
        operandLabel.text = string
    }
    
    private func setOperatorLabel(to string: String?) {
        operatorLabel.text = string
    }
    
    private func initOperatorAndOperandLabel() {
        setOperatorLabel(to: nil)
        setOperandLabel()
    }
    
    private func isOperandLabelZero() -> Bool {
        if operandLabel.text == "0" { return true }
        
        return false
    }
    
    private func inputNumber(by key: NumericKeypad) {
        guard var operand = operandLabel.text else { return }
        
        if (operand.last == "." || operand.contains(".")) && (key.rawValue == ".") ||
            isOperandLabelZero() && (key.rawValue == "0" || key.rawValue == "00") { return }
        
        if isOperandLabelZero(), key.rawValue != "." {
            operand = key.rawValue
        } else {
            operand += key.rawValue
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
    
    private func addHistoryStackView() {
        let historyLabels: [UIView] = [
            makeHistoryLabel(text: operatorLabel.text),
            makeHistoryLabel(text: operandLabel.text)
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
        guard let operand = operandLabel.text,
                  operand.last != "." else { return }
        
        let currentOperator = key.rawValue
        setOperatorLabel(to: currentOperator)

        if isOperandLabelZero() {
            return
        }
        
        addHistoryStackView()
        formula += operand + currentOperator
        setOperandLabel()
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
        
        setOperandLabel()
    }
    
    private func clearAll() {
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        initOperatorAndOperandLabel()
        formula = ""
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
            return
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
