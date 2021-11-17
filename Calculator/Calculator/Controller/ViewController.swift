
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
        initializeNumberLabel()
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        guard let text = numberLabel.text, text.isEmpty == false else { return }
        
        if isContainDot(text: text) {
            return
        } else {
            inputNumber += "."
            numberLabel.text = inputNumber
        }
    }
    @IBAction func negativePositiveButtonPressed(_ sender: UIButton) {
        guard var text = numberLabel.text, text.isEmpty == false else { return }
        
        if text.hasPrefix("-") {
            text = text.replacingOccurrences(of: "-", with: "")
        } else {
            text = "-" + text
        }
        
        inputNumber = text
        numberLabel.text = inputNumber
    }
    
    @IBAction func ACButtonPressed(_ sender: UIButton) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        initializeNumberLabel()
        initializeSymbolLabel()
    }
    
    func initializeNumberLabel() {
        inputNumber.removeAll()
        numberLabel.text?.removeAll()
    }
    
    func initializeSymbolLabel() {
        symbolLabel.text?.removeAll()
    }
    
    func isContainDot(text: String) -> Bool {
        return text.contains(".")
    }
}

