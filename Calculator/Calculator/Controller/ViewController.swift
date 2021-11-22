import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    var inputString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandsLabel.text = "0"
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
    
    func makeExpressionStackView() {
        let operandLabel = makeLabel(text: self.operandsLabel.text)
        let operatorLabel = makeLabel(text: self.operatorLabel.text)
        let smallStackview = makeStackView(with: operatorLabel, operandLabel)
        
        mainStackView.addArrangedSubview(smallStackview)
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle, let operandsLabelText = operandsLabel.text else {return}
        
        if operandsLabelText == "0" {
            operandsLabel.text = newInput
        } else {
            operandsLabel.text = operandsLabelText + newInput
        }

        if newInput == "00" {
            if operandsLabelText == "0" || operandsLabelText == "" {
                operandsLabel.text = "0"
            }
        }
        
        inputString.append(newInput)
        print(inputString)

    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        guard operandsLabel.text != "0" else { return }
        guard operandsLabel.text?.isEmpty == false else {return}
        makeExpressionStackView()
        inputString.append(`operator`)
        operandsLabel.text = ""
        operatorLabel.text = `operator`
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        operandsLabel.text = "0"
        operatorLabel.text = ""
        inputString = ""
        for i in mainStackView.arrangedSubviews {
            mainStackView.removeArrangedSubview(i)
            i.removeFromSuperview()
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        if operandsLabel.text?.isEmpty == false {
            operandsLabel.text?.removeLast()
        }
        
        if inputString.isEmpty == false {
            inputString.removeLast()
        }
        
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        guard let operandsLabelText = operandsLabel.text else {return}
        
        if operandsLabelText.contains("-") {
            operandsLabel.text = operandsLabelText.replacingOccurrences(of: "-", with: "")
        }
        else {
            operandsLabel.text = "-" + operandsLabelText
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle, let operandsLabelText = operandsLabel.text else {return}
        
        operandsLabel.text = operandsLabelText + newInput
        inputString.append(newInput)
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard operandsLabel.text != "0" else { return }
        guard operandsLabel.text?.isEmpty == false else {return}
        makeExpressionStackView()
        
        var formula: Formula = ExpressionParser.parse(from: inputString)
        print(inputString)
        print(formula.operands)
        print(formula.operators)
        let result = formula.result()
        print(result)
        operandsLabel.text = result.description
        operatorLabel.text = ""
        
    }

    
}

