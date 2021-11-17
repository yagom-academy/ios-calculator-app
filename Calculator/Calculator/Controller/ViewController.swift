
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var operatorsLabel: UILabel {
        let operatorsLabel = UILabel()
        operatorsLabel.text = "Hi"
        operatorsLabel.textColor = .white
        operatorsLabel.textAlignment = .right
        operatorsLabel.adjustsFontForContentSizeCategory = true
        return operatorsLabel
    }
    var operandsLabel: UILabel {
        let operandsLabel = UILabel()
        operandsLabel.text = "Bye"
        operandsLabel.textColor = .white
        operandsLabel.textAlignment = .right
        operandsLabel.adjustsFontForContentSizeCategory = true
//        operandsLabel.sizeToFit()
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
}
