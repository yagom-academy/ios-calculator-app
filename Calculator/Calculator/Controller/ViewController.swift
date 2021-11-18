
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    
    private var inputNumber = ""
    private var entireFormula = ""
    
    private var numberFormatter: NumberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNumberLabel()
        initializeSymbolLabel()
        initializeNumberFormatter(of: numberFormatter)
    }
    
    var operatorsLabel: UILabel {
        let operatorsLabel = UILabel()
        operatorsLabel.text = symbolLabel.text
        operatorsLabel.textColor = .white
        operatorsLabel.textAlignment = .right
        operatorsLabel.adjustsFontForContentSizeCategory = true
        return operatorsLabel
    }
    
    var operandsLabel: UILabel {
        let operandsLabel = UILabel()
        operandsLabel.text = numberLabel.text
        operandsLabel.textColor = .white
        operandsLabel.textAlignment = .right
        operandsLabel.adjustsFontForContentSizeCategory = true

        return operandsLabel
    }
    
    var formulaStackView: UIStackView {
        let formulaStackView = UIStackView()
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        formulaStackView.distribution = .fill
        formulaStackView.alignment = .firstBaseline
        if stackView.arrangedSubviews.count == 2 {
            formulaStackView.addArrangedSubview(operandsLabel)
        } else {
            formulaStackView.addArrangedSubview(operatorsLabel)
            formulaStackView.addArrangedSubview(operandsLabel)
        }
        return formulaStackView
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "0" || sender.currentTitle == "00" {
            guard inputNumber.isEmpty == false else { return }
            
            inputNumber += sender.currentTitle ?? ""
//            numberLabel.text = inputNumber
            numberLabel.text = numberFormatter.string(for: Double(inputNumber))
        } else {
            inputNumber += sender.currentTitle ?? ""
//            numberLabel.text = inputNumber
            numberLabel.text = numberFormatter.string(for: Double(inputNumber))
        }
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        if numberLabel.text == "0" {
            symbolLabel.text = sender.currentTitle
            initializeNumberLabel()
        } else {
            stackView.addArrangedSubview(formulaStackView)
            symbolLabel.text = sender.currentTitle
            addEntireFormula()
            initializeNumberLabel()
        }
        scrollToBottom(calculatorScrollView)
    }
    
    @IBAction func CEButtonPressed(_ sender: UIButton) {
        initializeNumberLabel()
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        guard var text = numberLabel.text else { return }
        
        guard !isContainDot(text: text) else { return }
        
        if text == "0" {
            inputNumber += "0."
            text = inputNumber
            numberLabel.text = text
        } else {
            inputNumber += "."
            text = inputNumber
            numberLabel.text = text
        }
    }
    
    @IBAction func negativePositiveButtonPressed(_ sender: UIButton) {
        guard var text = numberLabel.text, text != "0" else { return }
        
        if text.hasPrefix("-") {
            text = text.replacingOccurrences(of: "-", with: "")
        } else {
            text = "-" + text
        }
        
        inputNumber = text
        numberLabel.text = inputNumber
    }
    
    @IBAction func ACButtonPressed(_ sender: UIButton) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        entireFormula.removeAll()
        initializeNumberLabel()
        initializeSymbolLabel()
    }
    
    @IBAction func EqualButtonPressed(_ sender: UIButton) {
        guard symbolLabel.text?.isEmpty == false else { return }
        
        stackView.addArrangedSubview(formulaStackView)
        
        entireFormula += numberLabel.text ?? ""
        
        entireFormula = removeComma(of: entireFormula)
        
        var formula = ExpressionParser.parse(from: entireFormula)
        
        do {
            initializeSymbolLabel()
            
            let result = try formula.result()
            numberLabel.text = numberFormatter.string(for: result)
        } catch CalculateError.emptyQueue {
            return
        } catch CalculateError.divideWithZero {
            numberLabel.text = "NaN"
        } catch {
            print(error)
        }
    }
    
    func initializeNumberLabel() {
        inputNumber.removeAll()
        numberLabel.text = "0"
    }
    
    func initializeSymbolLabel() {
        symbolLabel.text?.removeAll()
    }
    
    func isContainDot(text: String) -> Bool {
        return text.contains(".")
    }
    
    func addEntireFormula() {
        guard let number = numberLabel.text, let symbol = symbolLabel.text else {
            return
        }
        entireFormula += number
        entireFormula += symbol
    }
    
    func initializeNumberFormatter(of formatter: NumberFormatter) {
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 20
    }
    
    func removeComma(of string: String) -> String {
        return string.replacingOccurrences(of: ",", with: "")
    }
    
    func scrollToBottom(_ scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height), animated: false)4
    }
}


