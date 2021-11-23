import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var operandLabel: UILabel!
    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var expressionsStackView: UIStackView!
    @IBOutlet weak private var expressionScrollView: UIScrollView!
    
    private var inputString: String = ""
    private var hasSuffixOperator: Bool {
        return Operator.allCases.reduce(false) {
            $0 == inputString.hasSuffix(String($1.rawValue))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        resetOperandLabel()
        resetOperatorLabel()
        removeSubviewsFromStackView()
    }
    

}

// MARK: - IBAction
extension ViewController {
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeOperandLabel(text: operand)
        print(inputString)
        
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        guard let currentText = operandLabel.text else { return }
        
        if currentText == "0" {
            updateOperatorLabel(text: `operator`)
            appendOperatorToInputString()
            print(inputString)
            return
        }
        
        addExpressionStackView()
        updateOperatorLabel(text: `operator`)
        appendOperandToInputString()
        appendOperatorToInputString()
        resetOperandLabel()
        print(inputString)

    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        initializeView()
        resetInputString()
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
        
        operandLabel.text = currentText
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
}

//MARK: - Method

extension ViewController {
    private func appendOperandToInputString() {
        guard let numberText = operandLabel.text else { return }
        
        inputString.append(numberText)
    }
    
    private func appendOperatorToInputString() {
        guard let `operator` = operatorLabel.text else { return }
        
        if hasSuffixOperator {
            inputString.removeLast()
        }
        
        inputString.append(`operator`)
    }
}
