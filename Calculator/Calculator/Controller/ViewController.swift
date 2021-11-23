import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var fomulaScrollView: UIScrollView!
    @IBOutlet var fomulaStackView: UIStackView!
    @IBOutlet var currentOperatorLable: UILabel!
    @IBOutlet var currentValueLable: UILabel!
    
    private let initialValue = "0"
    private var calculateTarget: [String] = []
    private var inputOperandValues: [String] = []
    private var isOperatorEntered: Bool = false
    private var signIsPositive: Bool = true
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
    
    @IBAction private func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text,
                  inputOperandValues.count < 20 else {
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
    
    private func addOperandToCalculateTarget() {
        if signIsPositive {
            calculateTarget.append(inputOperandValues.joined())
        } else {
            calculateTarget.append("-" + inputOperandValues.joined())
        }
        
        if currentOperatorLable.text != "" || currentValueLable.text != initialValue {
            addToFomulaHistory()
            fomulaScrollView.scrollViewToBottom()
        }
        
        isCalculated = false
        signIsPositive = true
    }
    
    @IBAction private func hitOperatorButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        addOperandToCalculateTarget()
        resetCurrentInputOperand()
        if isOperatorEntered {
            calculateTarget.removeLast()
            calculateTarget.append(inputButtonTitle)
        } else {
            calculateTarget.append(inputButtonTitle)
            isOperatorEntered = true
        }
        currentOperatorLable.text = inputButtonTitle
    }
    
    func resetToInitialState() {
        resetCurrentInputOperand()
        calculateTarget.removeAll()
        currentOperatorLable.text = ""
    }
    
    private func resetCurrentInputOperand() {
        inputOperandValues = [initialValue]
        currentValueLable.text = initialValue
    }
    
    @IBAction private func hitACButton(_ sender: UIButton) {
        resetToInitialState()
        removeStackViewContents()
    }
    
    @IBAction private func hitCEButton(_ sender: UIButton) {
        resetCurrentInputOperand()
        currentValueLable.text = initialValue
    }
    
    @IBAction private func hitCodeConversionButton(_ sender: UIButton) {
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

    
    @IBAction private func hitEqualButton(_ sender: UIButton) {
        guard calculateTarget != [initialValue] &&
              calculateTarget.count > 2 else {
              return
        }
        addOperandToCalculateTarget()
        
        let calculator = ExpressionParser.self
        let doubleTypeResult = calculator.parse(from: calculateTarget.joined()).result()
        resetCurrentInputOperand()
        if doubleTypeResult.isNaN {
            resetToInitialState()
            currentValueLable.text = "NaN"
        } else {
            resetToInitialState()
            currentValueLable.text = addCommaToValue(doubleTypeResult)
        }
        isCalculated = true
    }
    
    private func addCommaToValue(_ value: Double) -> String {
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

