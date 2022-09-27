import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    private var numberFormatter: NumberFormatter {
        var numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initOperatorAndOperandLabel()
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
    
    private func inputNumber(by key: NumericKeypad) {
        guard var operand = operandLabel.text else { return }
        
        if (operand.last == "." || operand.contains(".")),
           key.rawValue == "." { return }

        if operand == "0",
           (key.rawValue == "0" || key.rawValue == "00") { return }
        
        if operand == "0" {
            operand = key.rawValue
        } else {
            operand += key.rawValue
        }
        
        setOperandLabel(to: operand)
    }
    
    }
    
    @IBAction private func touchUpCalculatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle,
              let key = NumericKeypad(rawValue: buttonTitle) else { return }
        
        switch key {
        case _ where NumericKeypad.numKeys.contains(key):
            return
        case _ where NumericKeypad.operatorKeys.contains(key):
            return
        case .equal:
            return
        case .ac:
            return
        case .ce:
            return
        case .plusMinus:
            return
        default:
            return
        }
    }
}
