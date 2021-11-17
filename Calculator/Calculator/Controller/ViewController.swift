
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    private var inputNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var operatorsLabel: UILabel {
        let operatorsLabel = UILabel()
        operatorsLabel.text = symbolLabel.text
        operatorsLabel.textColor = .white
        operatorsLabel.textAlignment = .right
        operatorsLabel.adjustsFontForContentSizeCategory = true
        return operatorsLabel
    }
    
    var operandsLabel: UILabel {
        let operandsLabel = UILabel()
        operandsLabel.text = numberLabel.text
        operandsLabel.textColor = .white
        operandsLabel.textAlignment = .right
        operandsLabel.adjustsFontForContentSizeCategory = true

        return operandsLabel
    }
    
    var formulaStackView: UIStackView {
        let formulaStackView = UIStackView()
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        formulaStackView.distribution = .fill
        formulaStackView.alignment = .firstBaseline
        if stackView.arrangedSubviews.count == 2 {
            formulaStackView.addArrangedSubview(operandsLabel)
        } else {
            formulaStackView.addArrangedSubview(operatorsLabel)
            formulaStackView.addArrangedSubview(operandsLabel)
        }
        return formulaStackView
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "0" || sender.currentTitle == "00" {
            guard inputNumber.isEmpty == false else { return }
            
            inputNumber += sender.currentTitle ?? ""
            numberLabel.text = inputNumber
            
        } else {
            inputNumber += sender.currentTitle ?? ""
            numberLabel.text = inputNumber
        }
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        if numberLabel.text == "" {
            symbolLabel.text = sender.currentTitle
            initializeNumberLabel()
        } else {
            stackView.addArrangedSubview(formulaStackView)
            symbolLabel.text = sender.currentTitle
            initializeNumberLabel()
        }
    }
    
    @IBAction func CEButtonPressed(_ sender: UIButton) {
        inputNumber = ""
        numberLabel.text = inputNumber
        
        symbolLabel.text = ""
//        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        guard let text = numberLabel.text else { return }
        
        if text.isEmpty || isContainDot(text: text) {
            return
        } else {
            inputNumber += "."
            numberLabel.text = inputNumber
        }
    }
    
    func initializeNumberLabel() {
        inputNumber.removeAll()
        numberLabel.text?.removeAll()
    }
    
    func isContainDot(text: String) -> Bool {
        return text.contains(".")
    }
}

