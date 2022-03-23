//
//  MainViewController.swift
//  Calculator
//
//  Created by mmim.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var expressionRecordScrollView: UIScrollView!
    @IBOutlet weak var expressionRecordStackView: UIStackView!
    private var expressionRecord: [String?] = []
    private var totalOperand: String = ""
    private var operationCount: Int = 0
    private var isPlus: Bool = true
    private var isFirstTime: Bool = true
    private var isDotUsed: Bool = false
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
    }
    
    func setInitialState() {
        self.expressionRecordStackView.subviews.forEach{ $0.removeFromSuperview() }
        self.expressionRecord = []
        self.totalOperand = ""
        self.operationCount = 0
        self.operatorLabel.text = nil
        self.operandLabel.text = "0"
        self.isPlus = true
        self.isFirstTime = true
        self.isDotUsed = false
    }
    
    @IBAction func ACButtonClicked(_ sender: UIButton) {
        setInitialState()
    }
    
    @IBAction func CEButtonClicked(_ sender: UIButton) {
        self.operandLabel.text = "0"
        self.totalOperand = ""
    }
    
    @IBAction func signButtonClicked(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else if var numberScreen = operandLabel.text, isPlus == true {
            numberScreen.insert("-", at: numberScreen.startIndex)
            operandLabel.text = numberScreen
            isPlus = false
        } else {
            operandLabel.text?.removeFirst()
            isPlus = true
        }
    }
    
    @IBAction func dotButtonClicked(_ sender: UIButton) {
        guard let selectedOperand = sender.titleLabel?.text else { return }
        guard totalOperand.count < 20 else { return }
        
        if totalOperand.contains(".") == true {
            return
        }
        totalOperand += selectedOperand
        operandLabel.text = changeToNumberFormatter(with: totalOperand) + "."
        self.isDotUsed = true
    }
    
    @IBAction func operandButtonsClicked(_ sender: UIButton) {
        guard let selectedOperand = sender.titleLabel?.text else { return }
        guard totalOperand.count < 20 else { return }
        
        if isFirstTime == false && operatorLabel.text == nil {
            return
        } else if selectedOperand == "0" && totalOperand.last == "." {
            totalOperand += selectedOperand
            operandLabel.text = totalOperand
        } else if selectedOperand == "0" && totalOperand.last == "0" && isDotUsed == true {
            totalOperand += selectedOperand
            operandLabel.text = totalOperand
        } else if selectedOperand == "0" && totalOperand.first == "0" && isDotUsed == false {
            return
        } else {
            totalOperand += selectedOperand
            operandLabel.text = changeToNumberFormatter(with: totalOperand)
        }
    }
    
    @IBAction func operatorButtonsClicked(_ sender: UIButton) {
        operandLabel.text = changeToNumberFormatter(with: totalOperand)
        if isFirstTime == true && operandLabel.text == "0" {
            return
        } else if isFirstTime == true && operandLabel.text == "NaN" {
            return
        } else if isFirstTime == false && operandLabel.text == "0" {
            operatorLabel.text = sender.titleLabel?.text
            return
        } else {
            addToExpressionRecord(operatorLabel, operandLabel)
            operatorLabel.text = sender.titleLabel?.text
            operandLabel.text = "0"
            totalOperand = ""
            isFirstTime = false
        }
    }
    
    @IBAction func equalSignButtonClicked(_ sender: UIButton) {
        guard operatorLabel.text != nil else { return }
        operandLabel.text = changeToNumberFormatter(with: operandLabel.text ?? "")
        addToExpressionRecord(operatorLabel, operandLabel)
        operatorLabel.text = nil
        let expressionString: String = expressionRecord
                                        .compactMap{ $0 }
                                        .joined(separator: " ")
                                        .replacingOccurrences(of: ",", with: "")
        var expressionForm = ExpressionParser.parse(from: expressionString)
        let result = expressionForm.result()
        operandLabel.text = changeToNumberFormatter(with: result.description)
        totalOperand = operandLabel.text ?? ""
        expressionRecord.removeAll()
        self.isDotUsed = false
        if operandLabel.text == "NaN" {
            isFirstTime = true
        }
    }
    
    func insert(_ selectedOperator: UILabel, _ selectedOperand: UILabel) -> UIStackView {
        let subStackView = UIStackView()
        subStackView.spacing = 10
        
        let operatorInLog = UILabel()
        let operandInLog = UILabel()
        
        operatorInLog.textColor = .white
        operandInLog.textColor = .white
        operatorInLog.text = operatorLabel.text
        operandInLog.text = operandLabel.text
        
        subStackView.addArrangedSubview(operatorInLog)
        subStackView.addArrangedSubview(operandInLog)
        
        expressionRecord.append(operatorInLog.text)
        expressionRecord.append(operandInLog.text)
        
        return subStackView
    }
    
    func addToExpressionRecord(_ selectedOperator: UILabel, _ selectedOperand: UILabel) {
        expressionRecordStackView.addArrangedSubview(insert(selectedOperator, selectedOperand))
    }
    
    func changeToNumberFormatter(with totalOperand: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        let operandExpressionForm = numberFormatter.string(from: NSNumber(value: Double(totalOperand) ?? 0))
        return operandExpressionForm
    }
}
