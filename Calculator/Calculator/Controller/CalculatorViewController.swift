import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    
    private var currentFormula = ""
    private var currentNumber: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func convertToDecimal(_ number: Double) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        
        guard let value = numberFormat.string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return value
    }
    
    private func checkOperatorError() throws {
        guard currentFormula != "" else {
            throw CalculatorError.invalidOperatorInput
        }
        
        guard let lastInput = currentFormula.last, Operator(rawValue: lastInput) == nil else {
            throw CalculatorError.duplicatedOperator
        }
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        if sender.tag != 10 {
            currentNumber = currentNumber * 10 + Double(sender.tag)
        } else {
            currentNumber = currentNumber * 100
        }
       
        numberLable.text = convertToDecimal(currentNumber)
        currentFormula += sender.titleLabel?.text ?? ""
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        do {
            try checkOperatorError()
        } catch {
            switch error {
            case CalculatorError.duplicatedOperator:
                currentFormula = String(currentFormula.dropLast())
            case CalculatorError.invalidOperatorInput:
                return
            default:
                return
            }
        }
        
        operatorLable.text = sender.titleLabel?.text
        currentFormula += sender.titleLabel?.text ?? ""
        currentNumber = 0
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        do {
            var formula = try ExpressionParser.parse(from: currentFormula)
            let calculatedResult = try formula.result()
            numberLable.text = convertToDecimal(calculatedResult)
        } catch {
            switch error {
            case CalculatorError.dividedByZero:
                numberLable.text = "NaN"
            case CalculatorError.wrongFormula:
                return
            default:
                return
            }
        }
        
        operatorLable.text = ""
        currentNumber = 0
        currentFormula = ""
    }
    
    @IBAction private func ACButtonTapped(_ sender: UIButton) {
        numberLable.text = "0"
        operatorLable.text = ""
        currentFormula = ""
        currentNumber = 0
    }
    
    @IBAction private func CEButtonTapped(_ sender: UIButton) {
        if let number = Double(String(currentFormula.removeLast())) {
            currentNumber = (currentNumber - number) / 10
            numberLable.text = convertToDecimal(currentNumber)
        } else {
            operatorLable.text = ""
        }
    }
    
    @IBAction private func changeSignButtonTapped(_ sender: UIButton) {
        let numberCount = numberLable.text?.count ?? 0
    
        if let number = Double(currentFormula.suffix(numberCount)) {
            currentNumber *= -1
            numberLable.text = convertToDecimal(currentNumber)
            currentFormula = String(currentFormula.dropLast(numberCount)) + String(-number)
        }
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        currentNumber /= 10
        numberLable.text = convertToDecimal(currentNumber)
    }
}

