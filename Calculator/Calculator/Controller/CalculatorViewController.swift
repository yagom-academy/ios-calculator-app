import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var numberZeroButton: UIButton!
    @IBOutlet private weak var numberDoubleZeroButton: UIButton!
    @IBOutlet private weak var numberDotButton: UIButton!
    @IBOutlet private weak var numberOneButton: UIButton!
    @IBOutlet private weak var numberTwoButton: UIButton!
    @IBOutlet private weak var numberThreeButton: UIButton!
    @IBOutlet private weak var numberFourButton: UIButton!
    @IBOutlet private weak var numberFiveButton: UIButton!
    @IBOutlet private weak var numberSixButton: UIButton!
    @IBOutlet private weak var numberSevenButton: UIButton!
    @IBOutlet private weak var numberEightButton: UIButton!
    @IBOutlet private weak var numberNineButton: UIButton!
    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    static let zero: String = "0"
    static let empty: String = ""
    static let negativeSign: Character = "-"
    static let nanResult: String = "NaN"
    static let dotSymbol: String = "."
    
    private let numberFormatter = NumberFormatter()
    
    private var currentDisplayNumber: String = CalculatorViewController.zero {
        didSet {
            currentNumberLabel.text = currentDisplayNumber
            do {
                try inputIsWithinRange(currentDisplayNumber)
            } catch {
                clearInputtingOperand()
            }
        }
    }
    
    private var currentDisplayOperator: String = CalculatorViewController.empty {
        didSet {
            currentOperandLabel.text = currentDisplayOperator
        }
    }
    
    private var totalCalculate = CalculatorViewController.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNumberFormat()
        clearHistoryStackView()
        clearInputtingOperand()
        clearInputtingOperator()
    }
    
    private func setUpNumberFormat() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
    }
    
    private func inputIsWithinRange(_ inputtingOperand: String) throws {
        guard inputtingOperand.count <= 20 else {
            throw CalculatorError.outOfInputRange
        }
    }
    
    @IBAction private func clickNumber(_ sender: UIButton) {
        let clickValue = sender.currentTitle ?? CalculatorViewController.empty
        setCurrentDisplayNumber(clickValue)
    }
    
    private func setCurrentDisplayNumber(_ num: String) {
        
        if currentDisplayNumber == CalculatorViewController.zero {
            currentDisplayNumber = num
        } else {
            currentDisplayNumber = currentDisplayNumber + num
        }
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
        if currentDisplayNumber.isEmpty {
            return
        }
        updateHistoryStackView()
        addTotalCalculate()
        
        //resetCurrentDisplayNumber()
        let operatorItem = sender.currentTitle ?? CalculatorViewController.empty
        currentDisplayOperator = operatorItem
        clearInputtingOperand()
    }
    
    
    @IBAction func executeCalculatingAction(_ sender: UIButton) {
        guard totalCalculate.isEmpty == false else { return }
        
        updateHistoryStackView()
        addTotalCalculate()
        clearInputtingOperand()
        clearInputtingOperator()
        
        var parser = ExpressionParser.parse(from: totalCalculate)
        
        guard let result = try? parser.result() as Double else { return }
        configureCalculateResultLabel(result)
    }
    
    private func configureCalculateResultLabel(_ result: Double) {
        
        if result.isNaN {
           currentNumberLabel.text = CalculatorViewController.nanResult
        } else if cannotUseNumberFormatter(result) {
            let integerLength = String(result).components(separatedBy: CalculatorViewController.dotSymbol)[0].count
            currentNumberLabel.text = String(format: "%.\(String(20 - integerLength))f", result)
        } else {
            guard let numberFormattedResult = numberFormatter.string(for: result) else { return }
            currentNumberLabel.text = numberFormattedResult
        }
    }
    
    
    private func cannotUseNumberFormatter(_ result: Double) -> Bool {
        let componentsByDecimalSeperator = String(result).components(separatedBy: CalculatorViewController.dotSymbol)
        let integerLength = componentsByDecimalSeperator[0].count
        let decimalLength = componentsByDecimalSeperator[1].count
        
        return decimalLength >= 16 && integerLength + decimalLength < 20
    }
    
    
    @IBAction func clickDot(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        if currentDisplayNumber.contains(dot) {
            return
        } else {
            currentDisplayNumber = currentDisplayNumber + dot
        }
    }
    
    
    @IBAction func clickDoubleZero(_ sender: UIButton) {
        guard let doubleZero = sender.titleLabel?.text else{
            return
        }
        
        if currentDisplayNumber == CalculatorViewController.zero {
            return
        } else {
            currentDisplayNumber = currentDisplayNumber + doubleZero
        }
    }
    
    @IBAction private func allClear() {
        clearInputtingOperand()
        clearInputtingOperator()
        clearFormula()
        clearHistoryStackView()
    }
    
    @IBAction private func clearEntry() {
        clearInputtingOperand()
    }
    
    private func addTotalCalculate() {
        totalCalculate = "\(totalCalculate) \(currentOperandLabel.text ?? CalculatorViewController.empty) \(currentDisplayNumber)"
    }
    
    private func clearHistoryStackView() {
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearFormula() {
        totalCalculate = CalculatorViewController.empty
    }
    
    private func clearInputtingOperand() {
        currentDisplayNumber = CalculatorViewController.zero
    }
    
    private func clearInputtingOperator() {
        currentDisplayOperator = CalculatorViewController.empty
    }
    
    private func updateHistoryStackView() {
        let recordStackView = makeRecordStackView()
        historyStackView.addArrangedSubview(recordStackView)
        historyScrollView.layoutIfNeeded()
        let offsetY = historyScrollView.contentSize.height - historyScrollView.bounds.height
        if offsetY > 0 {
            historyScrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        }
    }
    
    private func makeRecordStackView() -> UIStackView {
        let recordStackView = UIStackView()
        recordStackView.axis = .horizontal
        
        let validOperandLabel = UILabel()
        validOperandLabel.text = numberFormatter.string(for: Double(currentDisplayNumber))
        validOperandLabel.textColor = .white
        
        let validOperatorLabel = UILabel()
        validOperatorLabel.text = currentDisplayOperator
        validOperatorLabel.textColor = .white
        
        [validOperatorLabel, validOperandLabel].forEach { recordStackView.addArrangedSubview($0) }

        return recordStackView
    }
    
   @IBAction private func updateOperandSign() {
        guard currentDisplayNumber != CalculatorViewController.zero else {
            return
        }
        
       if currentDisplayNumber.contains(CalculatorViewController.negativeSign) {
            currentDisplayNumber.removeFirst()
        } else {
            currentDisplayNumber.insert(CalculatorViewController.negativeSign, at: currentDisplayNumber.startIndex)
        }
    }
}

