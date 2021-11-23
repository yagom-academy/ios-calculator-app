import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var fomulaScrollView: UIScrollView!
    @IBOutlet var fomulaStackView: UIStackView!
    @IBOutlet var currentOperator: UILabel!
    @IBOutlet var currentValue: UILabel!
    
    let initialValue = "0"
    var stringToCalculate: [String] = []
    var inputOperandValues: [String] = []
    var isOperatorEntered: Bool = false
    var signIsPositive: Bool = true
    var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputOperandValues = [initialValue]
        isOperatorEntered = false
        currentValue.text = initialValue
    }
    
    func addToFomulaHistory() {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        let opertatorView = UILabel()
        opertatorView.text = currentOperator.text
        opertatorView.textColor = .white
        
        let operandView = UILabel()
        operandView.text = currentValue.text
        operandView.textColor = .white
        
        stackView.addArrangedSubview(opertatorView)
        stackView.addArrangedSubview(operandView)
        
        fomulaStackView.addArrangedSubview(stackView)
    }
    
    func removeStackViewContents() {
        fomulaStackView.arrangedSubviews.forEach({ (view: UIView) -> Void in view.removeFromSuperview()
        })
    }
    
    @IBAction func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        guard inputOperandValues.count <= 20 else {
            return
        }
        
        if inputOperandValues.contains(".") {
            guard inputButtonTitle != "." else {
                return
            }
        } else {
            guard inputButtonTitle != "0" || inputOperandValues.first != "0" else {
                return
            }
            guard inputButtonTitle != "00" || inputOperandValues.first != "0" else {
                return
            }
        }
        inputOperandValues.append(inputButtonTitle)
        
        if !inputOperandValues.contains(".") && inputOperandValues.first == initialValue {
            inputOperandValues.removeFirst()
        }
        
        let addcommaOperand: String
        if inputOperandValues.contains(".") {
            addcommaOperand = inputOperandValues.joined()
        } else {
            addcommaOperand = addCommaToValue(Double(inputOperandValues.joined()) ?? 0)
        }
        
        if signIsPositive {
            currentValue.text = addcommaOperand
        } else {
            currentValue.text = "-" + addcommaOperand
        }
        isOperatorEntered = false
    }
    
    func endOperandInput() {
        if signIsPositive {
            stringToCalculate.append(inputOperandValues.joined())
        } else {
            stringToCalculate.append("-" + inputOperandValues.joined())
        }
        
        if stringToCalculate != [initialValue] {
            addToFomulaHistory()
            fomulaScrollView.scrollViewToBottom()
        }
        
        inputOperandValues = [initialValue]
        currentValue.text = initialValue
        isCalculated = false
        signIsPositive = true
    }
    
    @IBAction func hitOperatorButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        endOperandInput()
        if isOperatorEntered {
            stringToCalculate.removeLast()
            stringToCalculate.append(inputButtonTitle)
        } else {
            stringToCalculate.append(inputButtonTitle)
            isOperatorEntered = true
        }
        currentOperator.text = inputButtonTitle
    }
    
    func resetToInitialState() {
        inputOperandValues = [initialValue]
        stringToCalculate.removeAll()
        isCalculated = false
        currentOperator.text = ""
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        resetToInitialState()
        removeStackViewContents()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        inputOperandValues.removeAll()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCodeConversionButton(_ sender: UIButton) {
        guard currentValue.text != initialValue else {
            return
        }
        guard let currentOperand = currentValue.text,
              let doubleTypeOperand = Double(currentOperand) else {
                  return
              }
        signIsPositive = !signIsPositive
        currentValue.text = String(format: "%.4g", doubleTypeOperand * -1)
    }

    
    @IBAction func hitEqualButton(_ sender: UIButton) {
        guard isCalculated == false,
              stringToCalculate != [initialValue] else {
              return
        }
        endOperandInput()
        let calculator = ExpressionParser.self
        let doubleTypeResult = calculator.parse(from: stringToCalculate.joined()).result()
        if doubleTypeResult.isNaN {
            resetToInitialState()
            currentValue.text = "NaN"
        } else {
            resetToInitialState()
            currentValue.text = addCommaToValue(doubleTypeResult)
        }
        isCalculated = true
    }
    
    func addCommaToValue(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let resultWithComma = numberFormatter.string(for: value) else {
            return "0"
        }
        return resultWithComma
    }
}


extension UIScrollView {
    func scrollViewToBottom() {
        let setOfBottem = CGPoint(x: 0, y: contentSize.height)
        setContentOffset(setOfBottem, animated: false)
    }
}

