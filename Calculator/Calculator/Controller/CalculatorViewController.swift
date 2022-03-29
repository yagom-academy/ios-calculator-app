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
    
    static let zero: String = "0"
    static let empty: String = ""
    static let negativeSign: Character = "-"
    static let nanResult: String = "NaN"
    
    
    private var currentDisplayNumber: String = "0" {
        didSet {
            currentNumberLabel.text = currentDisplayNumber
        }
    }
    
    private var currentDisplayOperator: String = "" {
        didSet {
            currentOperandLabel.text = currentDisplayOperator
        }
    }
    
    private var totalCalculate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func clickNumber(_ sender: UIButton) {
        let clickValue = sender.currentTitle ?? ""
        setCurrentDisplayNumber(clickValue)
    }
    
    private func setCurrentDisplayNumber(_ num: String) {
        
        if currentDisplayNumber == "0" {
            currentDisplayNumber = num
        } else {
            currentDisplayNumber = currentDisplayNumber + num
        }
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
        if currentDisplayNumber.isEmpty {
            return
        }
        addTotalCalculate()
        
        //resetCurrentDisplayNumber()
        let operatorItem = sender.currentTitle ?? ""
        currentDisplayOperator = operatorItem
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
        
        if currentDisplayNumber == "0" {
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
        totalCalculate = "\(totalCalculate) \(currentOperandLabel.text ?? "") \(currentDisplayNumber)"
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
}

