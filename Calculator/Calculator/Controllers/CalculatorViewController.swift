import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var calculatorLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private let calculator = Calculator()
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
    
    private func updateOperatorLabel() {
        operatorLabel.text = calculator.operator
    }
    
    private func updateCalculatorLabel() {
        if calculator.operand.last == Character(MathSymbol.decimalPoint) ||
            calculator.isOperandDecimal {
            calculatorLabel.text = calculator.operand
            return
        }
        
        calculatorLabel.text = numberFormatter.string(from: calculator.operand.convertNSNumber())
    }
    
    private func updateCalculatorLabel(to string: String) {
        calculatorLabel.text = numberFormatter.string(from: string.convertNSNumber())
    }
    
    private func updateAllCalculatorLabels() {
        updateOperatorLabel()
        updateCalculatorLabel()
    }
    
    private func inputNumber(by key: NumericKeypad) {
        let number = key.rawValue
        var newOperand = ""
        
        if number == "0" || number == "00",
           calculator.isOperandZero {
            return
        }
        
        if calculator.isFormulaEmpty ||
            calculator.isOperandZero {
            newOperand = number
        }
        
        newOperand = calculator.operand + number
        
        calculator.changeOperand(newOperand)
        updateCalculatorLabel()
    }
    
    private func inputDecimalPoint() {
        if calculator.isOperandDecimal {
            return
        }
        
        let newOperand = calculator.operand + MathSymbol.decimalPoint
        
        calculator.changeOperand(newOperand)
        updateCalculatorLabel()
    }
    
    private func clearAllHistory() {
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearAll() {
        calculator.initCalculation()
        updateAllCalculatorLabels()
        clearAllHistory()
    }
    
    private func clearEntry() {
        if calculator.isOperandZero { return }
        
        calculator.changeOperand()
        updateCalculatorLabel()
    }
    
    private func changeOperandSign() {
        var newOperand = ""
        
        if calculator.isOperandNegative {
            newOperand = String(calculator.operand.dropFirst())
        } else {
            newOperand = MathSymbol.negative + calculator.operand
        }
        
        calculator.changeOperand(newOperand)
        updateCalculatorLabel()
    }
    
    private func makeCalculatorLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func addCalculationHistory(`operator`: String, operand: String) {
        let calculatorLabels: [UIView] = [
            makeCalculatorLabel(text: `operator`),
            makeCalculatorLabel(text: numberFormatter.string(from: operand.convertNSNumber()))
        ]
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        calculatorLabels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        historyStackView.addArrangedSubview(stackView)
        historyScrollView.moveToBottom()
        clearEntry()
    }
    
    private func inputOperator(by key: NumericKeypad) {
        let `operator` = key.rawValue
 
        if calculator.operand.last == Character(MathSymbol.decimalPoint) { return }
        
        if calculator.isOperandZero {
            calculator.changeOperator(`operator`)
            updateOperatorLabel()
            
            return
        }
        
        calculator.addFormula()
        addCalculationHistory(operator: calculator.operator, operand: calculator.operand)
        calculator.changeOperator(`operator`)
        updateOperatorLabel()
    }
    
    private func inputEqual() {
        if calculator.operand.last == Character(MathSymbol.decimalPoint) ||
           calculator.isFormulaEmpty { return }
        
        calculator.addFormula()
        addCalculationHistory(operator: calculator.operator, operand: calculator.operand)
    }
    
    private func showCalculationResult() {
        var result = ""
        
        do {
            result = try String(calculator.calculate())
        } catch CalculatorError.divisionByZero {
            result = numberFormatter.notANumberSymbol
        } catch {
            return
        }
        
        updateCalculatorLabel(to: result)
        updateOperatorLabel()
    }
    
    @IBAction private func touchUpCalculatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle,
              let key = NumericKeypad(rawValue: buttonTitle) else { return }
        
        switch key {
        case _ where NumericKeypad.numKeys.contains(key):
            inputNumber(by: key)
        case .decimalPoint:
            inputDecimalPoint()
        case .ac:
            clearAll()
        case .ce:
            clearEntry()
        case .plusMinus:
            changeOperandSign()
        case _ where NumericKeypad.operatorKeys.contains(key):
            inputOperator(by: key)
        case .equal:
            inputEqual()
            showCalculationResult()
        default:
            return
        }
    }
}
