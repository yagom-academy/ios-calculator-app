import UIKit

class ViewController: UIViewController {
    private var currentValue: String?
    private var infixNotation = [String]()
    
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    private func reset() {
        currentValue = nil
        updateCurrentValueLabel()
        currentOperatorLabel.text = ""
        infixNotation = [String]()
        for history in historyStackView.arrangedSubviews {
            history.removeFromSuperview()
        }
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
        currentValue = "0"
        currentValueLabel.text = "0"
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
        //×÷
    }
    
    @IBAction func equalDidTap(_ sender: UIButton) {
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
