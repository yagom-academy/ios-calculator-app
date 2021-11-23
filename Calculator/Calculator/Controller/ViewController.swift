import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var fomulaScrollView: UIScrollView!
    @IBOutlet var fomulaStackView: UIStackView!
    @IBOutlet var currentOperatorLable: UILabel!
    @IBOutlet var currentValueLable: UILabel!
    
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
        currentValueLable.text = initialValue
    }
    
    private func addToFomulaHistory() {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        stackView.axis = .horizontal
        
        let opertatorView = UILabel()
        opertatorView.text = currentOperatorLable.text
        opertatorView.textColor = .white
        
        let operandView = UILabel()
        operandView.text = currentValueLable.text
        operandView.textColor = .white
        
        stackView.addArrangedSubview(opertatorView)
        stackView.addArrangedSubview(operandView)
        
        fomulaStackView.addArrangedSubview(stackView)
    }
    
    private func removeStackViewContents() {
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
            currentValueLable.text = addcommaOperand
        } else {
            currentValueLable.text = "-" + addcommaOperand
        }
        isOperatorEntered = false
    }
    
    func endOperandInput() {
        if signIsPositive {
            stringToCalculate.append(inputOperandValues.joined())
        } else {
            stringToCalculate.append("-" + inputOperandValues.joined())
        }
        
        if inputOperandValues != [initialValue] {
            addToFomulaHistory()
            fomulaScrollView.scrollViewToBottom()
        }
        
        inputOperandValues = [initialValue]
        currentValueLable.text = initialValue
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
        currentOperatorLable.text = inputButtonTitle
    }
    
    func resetToInitialState() {
        inputOperandValues = [initialValue]
        stringToCalculate.removeAll()
        currentOperatorLable.text = ""
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        resetToInitialState()
        removeStackViewContents()
        currentValueLable.text = initialValue
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        inputOperandValues.removeAll()
        currentValueLable.text = initialValue
    }
    
    @IBAction func hitCodeConversionButton(_ sender: UIButton) {
        guard currentValueLable.text != initialValue else {
            return
        }
        guard let currentOperand = currentValueLable.text,
              let doubleTypeOperand = Double(currentOperand) else {
                  return
              }
        signIsPositive = !signIsPositive
        currentValueLable.text = String(format: "%.4g", doubleTypeOperand * -1)
    }

    
    @IBAction func hitEqualButton(_ sender: UIButton) {
        guard isCalculated == false,
              inputOperandValues != [initialValue] else {
              return
        }
        endOperandInput()
        let calculator = ExpressionParser.self
        let doubleTypeResult = calculator.parse(from: stringToCalculate.joined()).result()
        if doubleTypeResult.isNaN {
            resetToInitialState()
            currentValueLable.text = "NaN"
        } else {
            resetToInitialState()
            currentValueLable.text = addCommaToValue(doubleTypeResult)
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

