
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
        operatorsLabel.text =
        operatorsLabel.textColor = .white
        operatorsLabel.textAlignment = .right
        operatorsLabel.adjustsFontForContentSizeCategory = true
        return operatorsLabel
    }
    var operandsLabel: UILabel {
        let operandsLabel = UILabel()
        operandsLabel.text =
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
        formulaStackView.addArrangedSubview(operatorsLabel)
        formulaStackView.addArrangedSubview(operandsLabel)
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
        symbolLabel.text = sender.currentTitle
    }
    
    @IBAction func CEButtonPressed(_ sender: UIButton) {
        inputNumber = ""
        numberLabel.text = inputNumber
        
        symbolLabel.text = ""
    }
    
    
}

