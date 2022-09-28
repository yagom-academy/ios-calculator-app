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
    
    private func setOperandLabel(to string: String?) {
        operandLabel.text = string
    }
    
    private func setOperatorLabel(to string: String?) {
        operatorLabel.text = string
    }
    
    private func initFormula() {
        formula = ""
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
        
        if (operand.last == "." || operand.contains(".")) && (keyNumber == ".") ||
            isOperandLabelZero() && (keyNumber == "0" || keyNumber == "00") { return }
        
        if (isOperandLabelZero() && keyNumber != ".") || formula == "" {
            operand = keyNumber
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
        let historyLabels: [UIView] = [
            makeHistoryLabel(text: operatorText),
            makeHistoryLabel(text: operandText)
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
        
        if formula == "" {
            addHistoryStackView(operatorText: nil, operandText: operand)
            formula += operand
        } else {
            addHistoryStackView(operatorText: currentOperator, operandText: operand)
            formula += currentOperator + operand
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
        initFormula()
    }
    
    private func calculate() throws -> Double {
        guard let operand = operandLabel.text,
              let currentOperator = operatorLabel.text,
              formula != "" else {
            throw CalculatorError.wrongFormula
        }
        
        formula += currentOperator + operand
        addHistoryStackView(operatorText: currentOperator, operandText: operand)
        
        var formulaStruct = ExpressionParser.parser(from: formula)
        
        return try formulaStruct.result()
    }
    
    private func showCalculationResult() {
        do {
            let result = try calculate()
            setOperandLabel(to: String(result))
        } catch CalculatorError.divisionByZero {
            setOperandLabel(to: numberFormatter.notANumberSymbol)
        } catch {
            return
        }
        
        setOperatorLabel(to: nil)
        initFormula()
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
