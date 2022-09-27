import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperatorAndOperandLabel()
    }
    
    private func resetOperatorAndOperandLabel() {
        operatorLabel.text = nil
        operandLabel.text = "0"
    }
}
