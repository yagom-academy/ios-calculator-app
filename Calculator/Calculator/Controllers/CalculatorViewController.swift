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
        
        resetOperatorAndOperandLabel()
    }
    
    private func resetOperatorAndOperandLabel() {
        operatorLabel.text = nil
        operandLabel.text = "0"
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
