import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberlable: UILabel!
    @IBOutlet weak var operatorlable: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var userFormula = UserFormula()
    private var numberText: String {
        return numberlable.text ?? "0"
    }
    private var pureNumberText: String {
        return numberText.filter { $0 != "," }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func convertToDecimal(_ number: Double) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        numberFormat.maximumFractionDigits = 20
        numberFormat.maximumSignificantDigits = 20
        
        guard let value = numberFormat.string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return value
    }
    
    private func checkOperatorError() throws {
        guard !userFormula.isEmpty else {
            throw CalculatorError.invalidOperatorInput
        }
        
        guard !userFormula.isLastOperator else {
            throw CalculatorError.duplicatedOperator
        }
    }
    
    private func addFormulaLable(content: String) {
        let lable = UILabel()
        lable.text = content
        lable.textColor = .white
        stackView.addArrangedSubview(lable)
    }
    
    private func printFormula() {
        guard !userFormula.isOnlyNumber else {
            addFormulaLable(content: userFormula.fullFormula)
            return
        }
        
        let numberCount = pureNumberText.count
        let number = userFormula.fullFormula.suffix(numberCount)
        
        if let `operator` = userFormula.fullFormula.dropLast(numberCount).last {
            addFormulaLable(content: String(`operator`) + " " + number)
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + 20), animated: false)
    }
    
    private func deleteFormulaLable() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        if userFormula.isLastOperator {
            numberlable.text = "0"
        }

        if let buttonText = sender.titleLabel?.text, let number = Double(pureNumberText + buttonText) {
            numberlable.text = convertToDecimal(number)
            userFormula.append(content: buttonText)
        }
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        do {
            try checkOperatorError()
            printFormula()
            numberlable.text = "0"
        } catch {
            switch error {
            case CalculatorError.duplicatedOperator:
                userFormula.dropLast()
            case CalculatorError.invalidOperatorInput:
                return
            default:
                return
            }
        }
        
        if let operatorText = sender.titleLabel?.text {
            operatorlable.text = operatorText
            userFormula.append(content: operatorText)
        }
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        if userFormula.isLastOperator {
            userFormula.append(content: "0")
        }
        
        do {
            var formula = try ExpressionParser.parse(from: userFormula.fullFormula)
            let calculatedResult = try formula.result()
            printFormula()
            numberlable.text = convertToDecimal(calculatedResult)
            userFormula.removeAll()
            userFormula.append(content: convertToDecimal(calculatedResult).filter { $0 != ","})
        } catch {
            switch error {
            case CalculatorError.dividedByZero:
                numberlable.text = "NaN"
                userFormula.removeAll()
            case CalculatorError.wrongFormula:
                userFormula.removeAll()
                return
            default:
                return
            }
        }
        
        operatorlable.text = ""
    }
    
    @IBAction private func ACButtonTapped(_ sender: UIButton) {
        deleteFormulaLable()
        numberlable.text = "0"
        operatorlable.text = ""
        userFormula.removeAll()
    }
    
    @IBAction private func CEButtonTapped(_ sender: UIButton) {
        if userFormula.isLastOperator {
            operatorlable.text = ""
        } else {
            numberlable.text = String(numberText.dropLast())
        }
        
        if numberlable.text == "" {
            numberlable.text = "0"
        }
        
        userFormula.dropLast()
    }
    
    @IBAction private func changeSignButtonTapped(_ sender: UIButton) {
        guard numberText != "0" else {
            return
        }
      
        var changeNumber: String
        
        if numberText.contains("-") {
            changeNumber = String(numberText.dropFirst())
        } else {
            changeNumber = "-" + numberText
        }
        
        let pureNumber = changeNumber.filter { $0 != "," }
        userFormula.dropLast(count: pureNumberText.count)
        userFormula.append(content: pureNumber)
        numberlable.text = changeNumber
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        if !numberText.contains(".") {
            numberlable.text = numberText + "."
            userFormula.append(content: ".")
        }
    }
}

