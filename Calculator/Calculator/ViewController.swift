import UIKit

class ViewController: UIViewController {
    private var currentValue: String?
    private var infixNotation = [String]()
    private let calculator = Calculator()
    
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    private func parse(from currentOperator: String) -> String {
        switch currentOperator {
        case "×":
            return "*"
        case "÷":
            return "/"
        case "−":
            return "-"
        default:
            return currentOperator
        }
    }
    
    private func resetCurrentValueAndLabel() {
        currentValue = nil
        updateCurrentValueLabel()
    }
    
    private func reset() {
        resetCurrentValueAndLabel()
        currentOperatorLabel.text = ""
        infixNotation = [String]()
        for history in historyStackView.arrangedSubviews {
            history.removeFromSuperview()
        }
    }
    
    private func pushToHistoryStackView(currentOperator: String, currentOperand: String) {
        let signLabel = UILabel()
        let numberLabel = UILabel()
        
        signLabel.text = currentOperator
        signLabel.textColor = .white
        signLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        numberLabel.text = currentOperand
        numberLabel.textColor = .white
        numberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let stackView = UIStackView(arrangedSubviews: [signLabel,numberLabel])
        stackView.spacing = 8
        historyStackView.addArrangedSubview(stackView)
        
    }
    
    private func updateCurrentValueLabel() {
        guard let currentValue = currentValue else {
            currentValueLabel.text = "0"
            return
        }
        currentValueLabel.text = currentValue
    }
    
    @IBAction func acDidTap(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func ceDidTap(_ sender: UIButton) {
        resetCurrentValueAndLabel()
    }
    
    @IBAction func switchSignDidTap(_ sender: UIButton) {
        guard let currentValue = currentValue, currentValue != "0" else { return }
        if let firstCharacter = currentValue.first, firstCharacter == "-" {
            self.currentValue?.removeFirst()
        } else {
            self.currentValue = "-" + currentValue
        }
        updateCurrentValueLabel()
    }
    
    @IBAction func operatorDidTap(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text,
              let previousOperator = currentOperatorLabel.text else { return }
        
        if let currentValue = currentValue {
            if previousOperator == "" {
                infixNotation.append(currentValue)
            } else {
                infixNotation.append(parse(from: previousOperator))
                infixNotation.append(currentValue)
            }
            pushToHistoryStackView(currentOperator: previousOperator, currentOperand: currentValue)
        }
        currentOperatorLabel.text = input
        resetCurrentValueAndLabel()
    }
    
    @IBAction func equalDidTap(_ sender: UIButton) {
        guard !infixNotation.isEmpty,
              let previousOperator = currentOperatorLabel.text else { return }
        infixNotation.append(parse(from: previousOperator))
        infixNotation.append(currentValue ?? "0")
        pushToHistoryStackView(currentOperator: previousOperator, currentOperand: currentValue ?? "0")
        calculator.replaceInfix(with: infixNotation)
        do {
            let result = try calculator.calculate()
            currentValueLabel.text = try calculator.format(for: result)
            guard let calculatedResult = result else { return }
            currentValue = String(calculatedResult)
        } catch {
            print("에러발생")
        }
        infixNotation.removeAll()
        currentOperatorLabel.text = ""
    }
    
    @IBAction func dotDidTap(_ sender: UIButton) {
        guard let currentValue = currentValue, !currentValue.contains(".") else { return }
        self.currentValue = currentValue + "."
        updateCurrentValueLabel()
    }
    
    @IBAction func numberDidTap(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else { return }
        guard let currentValue = currentValue else {
            self.currentValue = input
            if input == "00" {
                self.currentValue = "0"
            }
            updateCurrentValueLabel()
            return
        }
        if currentValue == "0" {
            if input == "00" {
                self.currentValue = "0"
            } else {
                self.currentValue = input
            }
        } else {
            self.currentValue = currentValue + input
        }
        updateCurrentValueLabel()
    }
}
