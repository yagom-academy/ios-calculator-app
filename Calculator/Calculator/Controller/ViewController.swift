import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var inputLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    var inputString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLabel.text = "0"
        operatorLabel.text = ""
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
        
        subviews.forEach {stackView.addArrangedSubview($0)}
        
        return stackView
    }
    
    func makeSmallStackView() {
        let operandLabel = makeLabel(text: self.inputLabel.text)
        let operatorLabel = makeLabel(text: self.operatorLabel.text)
        let smallStackview = makeStackView(with: operatorLabel, operandLabel)
        
        mainStackView.addArrangedSubview(smallStackview)
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle, let currentInput = inputLabel.text else {return}
        
        if currentInput == "0" {
            inputLabel.text = newInput
        } else {
            inputLabel.text = currentInput + newInput
        }
        
        if newInput == "00" {
            if currentInput == "0" || currentInput == "" {
                inputLabel.text = "0"
            }
        }
        
        inputString.append(newInput)
        print(inputString)

    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        guard inputLabel.text != "0" else { return }
        guard inputLabel.text?.isEmpty == false else {return}
        makeSmallStackView()
        inputString.append(`operator`)
        inputLabel.text = ""
        operatorLabel.text = `operator`
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        inputLabel.text = "0"
        operatorLabel.text = ""
        inputString = ""
        for i in mainStackView.arrangedSubviews {
            mainStackView.removeArrangedSubview(i)
            i.removeFromSuperview()
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        if inputLabel.text?.isEmpty == false {
            inputLabel.text?.removeLast()
        }
        
        if inputString.isEmpty == false {
            inputString.removeLast()
        }
        
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        guard let currentInput = inputLabel.text else {return}
        
        if currentInput.contains("-") {
            inputLabel.text = currentInput.replacingOccurrences(of: "-", with: "")
        }
        else {
            inputLabel.text = "-" + currentInput
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle, let currentInput = inputLabel.text else {return}
        
        inputLabel.text = currentInput + newInput
        inputString.append(newInput)
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard inputLabel.text != "0" else { return }
        guard inputLabel.text?.isEmpty == false else {return}
        makeSmallStackView()
        
        var formula: Formula = ExpressionParser.parse(from: inputString)
        print(inputString)
        print(formula.operands)
        print(formula.operators)
        let result = formula.result()
        print(result)
        inputLabel.text = result.description
        operatorLabel.text = ""
        
    }

    
}

