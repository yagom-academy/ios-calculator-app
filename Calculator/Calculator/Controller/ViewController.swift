
import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var recordingStackView: UIStackView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var calculatorScrollView: UIScrollView!
    
    private var inputNumber = ""
    private var resultNumber = ""
    private var entireFormula = ""
    
    private var numberFormatter: NumberFormatter = NumberFormatter()
    
    private var operatorsLabel: UILabel {
        let operatorsLabel = UILabel()
        operatorsLabel.text = symbolLabel.text
        operatorsLabel.textColor = .white
        operatorsLabel.textAlignment = .right
        operatorsLabel.adjustsFontForContentSizeCategory = true
    
        return operatorsLabel
    }
    
    private var operandsLabel: UILabel {
        let operandsLabel = UILabel()
        operandsLabel.text = numberLabel.text
        operandsLabel.textColor = .white
        operandsLabel.textAlignment = .right
        operandsLabel.adjustsFontForContentSizeCategory = true

        return operandsLabel
    }
    
    private var formulaStackView: UIStackView {
        let formulaStackView = UIStackView()
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        formulaStackView.distribution = .fill
        formulaStackView.alignment = .firstBaseline
        if recordingStackView.arrangedSubviews.count != 0 {
            formulaStackView.addArrangedSubview(operatorsLabel)
        }
        formulaStackView.addArrangedSubview(operandsLabel)
        
        return formulaStackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNumberLabel()
        initializeSymbolLabel()
        initializeNumberFormatter(of: numberFormatter)
        recordingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func numberButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "0" || sender.currentTitle == "00" {
            guard inputNumber.isEmpty == false else { return }
            
            inputNumber += sender.currentTitle ?? ""
            
            if inputNumber.isContainDot {
                numberLabel.text = inputNumber
            } else {
                numberLabel.text = numberFormatter.string(for: Double(inputNumber))
            }
            
        } else {
            inputNumber += sender.currentTitle ?? ""
            numberLabel.text = numberFormatter.string(for: Double(removeComma(of: inputNumber)))
        }
    }
    
    @IBAction private func operatorButtonPressed(_ sender: UIButton) {
        if numberLabel.text == "0" || resultNumber == numberLabel.text {
            symbolLabel.text = sender.currentTitle
        } else {
            addRecord(with: sender.currentTitle)
        }
        initializeNumberLabel()
        scrollToBottom(calculatorScrollView)
    }
    
    @IBAction private func CEButtonPressed(_ sender: UIButton) {
        initializeNumberLabel()
    }
    
    @IBAction private func dotButtonPressed(_ sender: UIButton) {
        guard var text = numberLabel.text, text.isContainDot == false else { return }
        
        text += "."
        inputNumber = text
        numberLabel.text = inputNumber
    }
    
    @IBAction private func negativePositiveButtonPressed(_ sender: UIButton) {
        guard var text = numberLabel.text, text != "0" else { return }
        
        if text.hasPrefix("-") {
            text = text.replacingOccurrences(of: "-", with: "")
        } else {
            text = "-" + text
        }
        
        inputNumber = text
        numberLabel.text = inputNumber
    }
    
    @IBAction private func ACButtonPressed(_ sender: UIButton) {
        recordingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        entireFormula.removeAll()
        resultNumber.removeAll()
        initializeNumberLabel()
        initializeSymbolLabel()
    }
    
    @IBAction private func EqualButtonPressed(_ sender: UIButton) {
        guard symbolLabel.text?.isEmpty == false else { return }
        addRecord(with: sender.currentTitle)
        entireFormula = removeComma(of: entireFormula)
        
        var formula = ExpressionParser.parse(from: entireFormula)
        do {
            initializeSymbolLabel()
            let result = try formula.result()
            numberLabel.text = numberFormatter.string(for: result)
            resultNumber = numberLabel.text ?? ""
        } catch CalculateError.emptyQueue {
            return
        } catch CalculateError.divideWithZero {
            numberLabel.text = "NaN"
        } catch {
            print(error)
        }
    }
    
    private func addRecord(with operator: String?) {
        recordingStackView.addArrangedSubview(formulaStackView)
        scrollToBottom(calculatorScrollView)
        entireFormula += symbolLabel.text ?? ""
        entireFormula += numberLabel.text ?? ""
        
        if `operator` != "=" {
            symbolLabel.text = `operator`
        }
    }
    
    private func initializeNumberLabel() {
        inputNumber.removeAll()
        numberLabel.text = "0"
    }
    
    private func initializeSymbolLabel() {
        symbolLabel.text?.removeAll()
    }
    
    private func initializeNumberFormatter(of formatter: NumberFormatter) {
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 20
    }
    
    private func removeComma(of string: String) -> String {
        return string.replacingOccurrences(of: ",", with: "")
    }
    
    private func scrollToBottom(_ scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height), animated: false)
    }
}

fileprivate extension String {
    var isContainDot: Bool {
        return self.contains(".")
    }
}
