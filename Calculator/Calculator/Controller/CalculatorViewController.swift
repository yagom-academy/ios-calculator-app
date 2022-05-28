import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var userFormula = UserFormula()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func convertToDecimal(_ number: Double) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        numberFormat.maximumFractionDigits = 20
        
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
        
        let numberCount = (numberLable.text ?? "0").filter { $0 != "," }.count
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
            numberLable.text = "0"
        }
        
        let numberText = (numberLable.text ?? "0").filter { $0 != "," }
        
        if let buttonText = sender.titleLabel?.text, let number = Double(numberText + buttonText) {
            numberLable.text = convertToDecimal(number)
            userFormula.append(content: buttonText)
        }
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        do {
            try checkOperatorError()
            printFormula()
            numberLable.text = "0"
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
            operatorLable.text = operatorText
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
            numberLable.text = convertToDecimal(calculatedResult)
            userFormula.removeAll()
            userFormula.append(content: convertToDecimal(calculatedResult).filter { $0 != ","})
        } catch {
            switch error {
            case CalculatorError.dividedByZero:
                numberLable.text = "NaN"
                userFormula.removeAll()
            case CalculatorError.wrongFormula:
                userFormula.removeAll()
                return
            default:
                return
            }
        }
        
        operatorLable.text = ""
    }
    
    @IBAction private func ACButtonTapped(_ sender: UIButton) {
        deleteFormulaLable()
        numberLable.text = "0"
        operatorLable.text = ""
        userFormula.removeAll()
    }
    
    @IBAction private func CEButtonTapped(_ sender: UIButton) {
        if userFormula.isLastOperator {
            operatorLable.text = ""
        } else {
            numberLable.text = String((numberLable.text ?? "0").dropLast())
        }
        
        if numberLable.text == "" {
            numberLable.text = "0"
        }
        
        userFormula.dropLast()
    }
    
    @IBAction private func changeSignButtonTapped(_ sender: UIButton) {
        let numberText = numberLable.text ?? "0"
        let pureNumber = numberText.filter { $0 != "," }
        
        guard numberText != "0" else {
            return
        }
      
        if numberText.contains("-") {
            let plusNumber = numberText.dropFirst()
            let purePlusNumber = plusNumber.filter { $0 != "," }
            numberLable.text = String(plusNumber)
            userFormula.dropLast(count: pureNumber.count)
            userFormula.append(content: purePlusNumber)
        } else {
            let minusNumber = "-" + numberText
            let pureMinusNumber = minusNumber.filter { $0 != "," }
            numberLable.text = minusNumber
            userFormula.dropLast(count: pureNumber.count)
            userFormula.append(content: pureMinusNumber)
        }
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        let numberText = numberLable.text ?? "0"
        
        if !numberText.contains(".") {
            numberLable.text = numberText + "."
            userFormula.append(content: ".")
        }
    }
}

