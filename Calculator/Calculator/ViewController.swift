import UIKit

class ViewController: UIViewController {
    private var currentValue = "0"
    private var infixNotation = [String]()
    
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        updateCurrentValueLabel()
    }
    
    private func reset() {
        currentValueLabel.text = "0"
        currentOperatorLabel.text = ""
        infixNotation = [String]()
        for history in historyStackView.arrangedSubviews {
            history.removeFromSuperview()
        }
        
    }
    private func updateCurrentValueLabel() {
        currentValueLabel.text = currentValue
    }
    
    @IBAction func acDidTap(_ sender: UIButton) {
        
    }
    @IBAction func ceDidTap(_ sender: UIButton) {
    }
    @IBAction func switchSignDidTap(_ sender: UIButton) {
    }
    @IBAction func operatorDidTap(_ sender: UIButton) {
        //×÷
        
        
    }
    @IBAction func equalDidTap(_ sender: UIButton) {
    }
    @IBAction func dotDidTap(_ sender: UIButton) {
        guard !currentValue.contains(".") else { return }
        currentValue += "."
        updateCurrentValueLabel()
    }
    
    @IBAction func numberDidTap(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else { return }
        
        if currentValue == "0" {
            guard input != "0" && input != "00" else { return }
                currentValue = input
        } else {
            currentValue += input
        }
        updateCurrentValueLabel()
    }
}
