import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var operandLabel: UILabel!
    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var expressionsStackView: UIStackView!
    @IBOutlet weak private var expressionScrollView: UIScrollView!
    
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
        operandLabel.text = ""
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = "0"
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
