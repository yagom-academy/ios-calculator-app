import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLabel.text = "0"
    }
    
    func makeLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
    
    func makeStackView(with subviews: UIView...) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.alignment = .fill
        
        for i in subviews {
            stackView.addArrangedSubview(i)
        }
        
        return stackView
    }
    
    func makeSmallStackView() {
        let operandLabel = makeLabel(text: self.inputLabel.text)
        let operatorLabel = makeLabel(text: self.operatorLabel.text)
        let smallStackview = makeStackView(with: operatorLabel,operandLabel)
        
        mainStackView.addArrangedSubview(smallStackview)
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {return}
        inputLabel.text?.append(contentsOf: operand)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        operatorLabel.text = `operator`
        makeSmallStackView()
        inputLabel.text = ""
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        inputLabel.text = "0"
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        if inputLabel.text?.isEmpty == false {
            inputLabel.text?.removeLast()
        }
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        
    }

    
}

