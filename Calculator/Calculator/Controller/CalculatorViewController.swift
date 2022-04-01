import UIKit

enum CalcualtorConstant {
    static let zero: String = "0"
    static let empty: String = ""
    static let negativeSign: Character = "-"
    static let nanResult: String = "NaN"
    static let dotSymbol: String = "."
    static let maximumDecimalCount: Int = 20
}

final class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    
    private var inputNumber: String = CalcualtorConstant.zero {
        didSet {
            numberLabel.text = inputNumber
            do {
                try checkInputIsWithinRange(inputNumber)
            } catch {
                clearInputNumber()
            }
        }
    }
    
    private var inputOperator: String = CalcualtorConstant.empty {
        didSet {
            operatorLabel.text = inputOperator
        }
    }
    
    private var formulaString = CalcualtorConstant.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNumberFormat()
        clearHistoryStackView()
        clearInputNumber()
        clearInputOperator()
    }
    
    private func checkInputIsWithinRange(_ inputtingOperand: String) throws {
        guard inputtingOperand.count <= CalcualtorConstant.maximumDecimalCount else {
            throw CalculatorError.outOfInputRange
        }
    }
    
    private func setUpNumberFormat() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = CalcualtorConstant.maximumDecimalCount
        numberFormatter.roundingMode = .halfUp
    }
    
    private func clearFormulaString() {
        formulaString = CalcualtorConstant.empty
    }
    
    private func clearHistoryStackView() {
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearInputNumber() {
        inputNumber = CalcualtorConstant.zero
    }
    
    private func clearInputOperator() {
        inputOperator = CalcualtorConstant.empty
    }
    
    @IBAction private func clickNumber(_ sender: UIButton) {
        let clickValue = sender.currentTitle ?? CalcualtorConstant.empty
        setInputNumber(clickValue)
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
        guard inputNumber.isEmpty == false else { return }
        
        updateHistoryStackView()
        updateFormulaString()
        
        let operatorItem = sender.currentTitle ?? CalcualtorConstant.empty
        inputOperator = operatorItem
        clearInputNumber()
    }
    
    @IBAction private func clickCalculation(_ sender: UIButton) {
        guard formulaString.isEmpty == false else { return }
        
        updateHistoryStackView()
        updateFormulaString()
        clearInputNumber()
        clearInputOperator()
        
        var parser = ExpressionParser.parse(from: formulaString)
        
        guard let result = try? parser.result() as Double else { return }
        showCalculateResult(result)
    }
    
    @IBAction private func clickDot(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        if inputNumber.contains(dot) {
            return
        } else {
            inputNumber = inputNumber + dot
        }
    }
    
    @IBAction private func clickDoubleZero(_ sender: UIButton) {
        guard let doubleZero = sender.titleLabel?.text else{
            return
        }
        
        if inputNumber == CalcualtorConstant.zero {
            return
        } else {
            inputNumber = inputNumber + doubleZero
        }
    }
    
    @IBAction private func clickAllClear() {
        clearInputNumber()
        clearInputOperator()
        clearFormulaString()
        clearHistoryStackView()
    }
    
    @IBAction private func clickClearEntry() {
        clearInputNumber()
    }
    
    @IBAction private func clickOperandSign() {
        guard inputNumber != CalcualtorConstant.zero else {
            return
        }
        
        if inputNumber.contains(CalcualtorConstant.negativeSign) {
            inputNumber.removeFirst()
        } else {
            inputNumber.insert(CalcualtorConstant.negativeSign, at: inputNumber.startIndex)
        }
    }
    
    private func setInputNumber(_ num: String) {
        if inputNumber == CalcualtorConstant.zero {
            inputNumber = num
        } else {
            inputNumber = inputNumber + num
        }
    }
    
    private func updateFormulaString() {
        formulaString = "\(formulaString) \(inputOperator) \(inputNumber)"
    }
    
    private func updateHistoryStackView() {
        let recordStackView = recordStackView()
        historyStackView.addArrangedSubview(recordStackView)
        historyScrollView.layoutIfNeeded()
        let offsetY = historyScrollView.contentSize.height - historyScrollView.bounds.height
        if offsetY > 0 {
            historyScrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        }
    }
    
    private func recordStackView() -> UIStackView {
        let recordStackView = UIStackView()
        recordStackView.axis = .horizontal
        
        let validOperandLabel = UILabel()
        validOperandLabel.text = numberFormatter.string(for: Double(inputNumber))
        validOperandLabel.textColor = .white
        
        let validOperatorLabel = UILabel()
        validOperatorLabel.text = inputOperator
        validOperatorLabel.textColor = .white
        
        [validOperatorLabel, validOperandLabel].forEach { recordStackView.addArrangedSubview($0) }

        return recordStackView
    }
    
    private func showCalculateResult(_ result: Double) {
        if result.isNaN {
           numberLabel.text = CalcualtorConstant.nanResult
        } else if cannotUseNumberFormatter(result) {
            let integerLength = String(result).components(separatedBy: CalcualtorConstant.dotSymbol)[0].count
            numberLabel.text = String(format: "%.\(String(CalcualtorConstant.maximumDecimalCount - integerLength))f", result)
        } else {
            guard let numberFormattedResult = numberFormatter.string(for: result) else { return }
            numberLabel.text = numberFormattedResult
        }
    }
    
    private func cannotUseNumberFormatter(_ result: Double) -> Bool {
        let componentsByDecimalSeperator = String(result).components(separatedBy: CalcualtorConstant.dotSymbol)
        let integerLength = componentsByDecimalSeperator[0].count
        let decimalLength = componentsByDecimalSeperator[1].count
        
        return decimalLength >= 16 && integerLength + decimalLength < CalcualtorConstant.maximumDecimalCount
    }
}

