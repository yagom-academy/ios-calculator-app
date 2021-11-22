import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    private var inputString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func makeLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
    
    private func makeStackView(with subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.alignment = .fill
        
        subviews.forEach {stackView.addArrangedSubview($0)}
        
        return stackView
    }
    
    private func makeExpressionStackView() {
        let operandLabel = makeLabel(text: self.operandsLabel.text)
        let operatorLabel = makeLabel(text: self.operatorLabel.text)
        let expressionStackview = makeStackView(with: [operatorLabel, operandLabel])
        
        mainStackView.addArrangedSubview(expressionStackview)
    }
    
    private func changeOperandsLabelText(newInput: String) {
        guard let currentText = operandsLabel.text else {return}
        if currentText == "0" {
            operandsLabel.text = newInput
        } else {
            operandsLabel.text = currentText + newInput
        }

        if newInput == "00" {
            if currentText == "0" || currentText == "" {
                operandsLabel.text = "0"
            }
        }
    }
    
    private func initializeOperandsLabel() {
        operandsLabel.text = "0"
    }
    
    private func initializeOpertorLabel() {
        operatorLabel.text = ""
    }
    
    private func initializeInputString() {
        inputString = ""
    }
    
    private func updateOperandsLabel(text operands: String) {
        operandsLabel.text = operands
    }
    
    private func updateOperatorLabel(text operator: String) {
        operatorLabel.text = `operator`
    }
    
    private func appendInputString(text input: String) {
        inputString.append(input)
    }
    
    private func removeTextFromInputString() {
        if inputString.isEmpty == false {
            inputString.removeLast()
        }
    }
    
    private func removeTextFromOperandsLabel() {
        if operandsLabel.text?.isEmpty == false {
            operandsLabel.text?.removeLast()
        }
    }
    
    private func removeSubviewsFromStackView() {
        for i in mainStackView.arrangedSubviews {
            mainStackView.removeArrangedSubview(i)
            i.removeFromSuperview()
        }
    }
    
    private func changePlusMinus() {
        guard let operandsLabelText = operandsLabel.text else {return}
        
        if operandsLabelText.contains("-") {
            operandsLabel.text = operandsLabelText.replacingOccurrences(of: "-", with: "")
        } else {
            operandsLabel.text = "-" + operandsLabelText
        }
    }
    
    private func drawResultFromExpression() -> Double {
        var formula: Formula = ExpressionParser.parse(from: inputString)
        let result = formula.result()
        return result
    }
    
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle else {return}
        changeOperandsLabelText(newInput: newInput)
        appendInputString(text: newInput)
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        guard operandsLabel.text != "0" else {return}
        guard operandsLabel.text?.isEmpty == false else {return}
        
        makeExpressionStackView()
        initializeOperandsLabel()
        updateOperatorLabel(text: `operator`)
        appendInputString(text: `operator`)
    }
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        initializeOperandsLabel()
        initializeOpertorLabel()
        initializeInputString()
        removeSubviewsFromStackView()
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        removeTextFromOperandsLabel()
        removeTextFromInputString()
    }
    
    @IBAction private func touchUpPlusMinusButton(_ sender: UIButton) {
        changePlusMinus()
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let newInput = sender.currentTitle, let operandsLabelText = operandsLabel.text else {return}
        
        updateOperandsLabel(text: operandsLabelText + newInput)
        appendInputString(text: newInput)
    }
    
    @IBAction private func touchUpResultButton(_ sender: UIButton) {
        guard operandsLabel.text != "0" else { return }
        guard operandsLabel.text?.isEmpty == false else {return}
        
        makeExpressionStackView()
        updateOperandsLabel(text: drawResultFromExpression().description)
        initializeOpertorLabel()
    }
}

