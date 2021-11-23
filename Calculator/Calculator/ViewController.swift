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

// MARK: - View Method
extension ViewController {
    private func removeSubviewsFromStackView() {
        expressionsStackView.arrangedSubviews.forEach{$0.removeFromSuperview()}
    }
    
    private func resetOperandLabel() {
        operandLabel.text = ""
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = "0"
    }
}
