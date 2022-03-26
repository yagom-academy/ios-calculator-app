//
//  MainViewController.swift
//  Calculator
//
//  Created by mmim.

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var expressionRecordScrollView: UIScrollView!
    @IBOutlet weak var expressionRecordStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    private var expressionRecord: [String?] = []
    private var sumOfOperands: String = ""
    private var isFirstTime: Bool = true
    private var isDotUsed: Bool = false
    private var isNone: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
    }
    
    private func setInitialState() {
        self.expressionRecordStackView.subviews.forEach{ $0.removeFromSuperview() }
        self.expressionRecord = []
        self.sumOfOperands = ""
        self.operatorLabel.text = nil
        self.operandLabel.text = "0"
        self.isFirstTime = true
        self.isDotUsed = false
        self.isNone = true
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        setInitialState()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
        sumOfOperands = ""
    }
    
    @IBAction func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else {
            return
        }
        
        if var recentOperandLabel = operandLabel.text, recentOperandLabel.first != "-" {
            recentOperandLabel.insert("-", at: recentOperandLabel.startIndex)
            sumOfOperands = recentOperandLabel
            operandLabel.text = sumOfOperands
            return
        }
        
        operandLabel.text?.removeFirst()
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let selectedOperand = sender.titleLabel?.text,
              sumOfOperands.count < 16,
              sumOfOperands.contains(".") == false else {
                  return
              }
        
        sumOfOperands += selectedOperand
        operandLabel.text = changeToNumberFormatter(with: sumOfOperands) + "."
        self.isDotUsed = true
    }
    
    private func recombineByDot(with selectedOperand: String) {
        guard let integer = sumOfOperands.split(with: ".").first,
              let numberAfterDot = sumOfOperands.split(with: ".").last else {
                  return
              }
        
        operandLabel.text = changeToNumberFormatter(with: integer) + "." + numberAfterDot
    }
    
    private func handleException(of selectedOperand: String, isZero: Bool) {
        guard isZero == false,
              sumOfOperands.first != "0" || isDotUsed != false else {
                  return
              }
        
        if sumOfOperands.last == "." || (sumOfOperands.last == "0" && isDotUsed == true) {
            sumOfOperands += selectedOperand
            recombineByDot(with: selectedOperand)
            return
        }
    }
    
    private func setOperandLabel(from selectedOperand: String, isZero: Bool) {
        guard isZero == false else {
            return
        }
        if operandLabel.text == "NaN" {
            setInitialState()
        }
        sumOfOperands += selectedOperand
        operandLabel.text = changeToNumberFormatter(with: sumOfOperands)
    }
    
    private func updateOperandLabel(by selectedOperand: String) {
        guard isFirstTime == true || operatorLabel.text != nil else {
            return
        }
        handleException(of: selectedOperand, isZero: selectedOperand.last == "0")
        setOperandLabel(from: selectedOperand, isZero: selectedOperand.last == "0")
    }
    
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
        guard let selectedOperand = sender.titleLabel?.text,
              sumOfOperands.count < 16 else {
                  return
              }
        
        updateOperandLabel(by: selectedOperand)
        
        isNone = false
    }
    
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        operandLabel.text = changeToNumberFormatter(with: sumOfOperands)
        guard isFirstTime == false || operandLabel.text != "0",
              isFirstTime == false || operandLabel.text != "NaN" else {
                  return
              }
        
        if isFirstTime == false && operandLabel.text == "0" && isNone == true {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        addToExpressionRecord()
        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = "0"
        sumOfOperands = ""
        isFirstTime = false
        isDotUsed = false
        isNone = true
    }
    
    private func prepareBeforeResult() {
        operandLabel.text = changeToNumberFormatter(with: sumOfOperands)
        addToExpressionRecord()
        operatorLabel.text = nil
    }
    
    private func calculate() -> String {
        let expressionString: String = expressionRecord
                                        .compactMap{ $0 }
                                        .joined(separator: " ")
                                        .replacingOccurrences(of: ",", with: "")
        var expressionForm = ExpressionParser.parse(from: expressionString)
        return changeToNumberFormatter(with: expressionForm.result().description)
    }
    
    private func setExpression(with result: String) {
        if result == "-0" {
            operandLabel.text = "0"
        } else if result == "NaN" {
            isFirstTime = true
            operandLabel.text = result
        } else {
            operandLabel.text = result
        }
        sumOfOperands = operandLabel.text ?? ""
        expressionRecord.removeAll()
        isDotUsed = false
    }
    
    @IBAction func equalSignButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != nil else {
            return
        }
        
        prepareBeforeResult()
        
        let result = calculate()
        
        setExpressionAfter(result)
    }
    
    private func makeSubStackView() -> UIStackView {
        let subStackView = UIStackView()
        let operatorInRecord = UILabel()
        let operandInRecord = UILabel()
        
        subStackView.spacing = 10
        operatorInRecord.textColor = .white
        operandInRecord.textColor = .white
        operatorInRecord.text = operatorLabel.text
        operandInRecord.text = operandLabel.text
        
        subStackView.addArrangedSubview(operatorInRecord)
        subStackView.addArrangedSubview(operandInRecord)
        expressionRecord.append(operatorInRecord.text)
        expressionRecord.append(operandInRecord.text)
        
        return subStackView
    }
    
    private func addToExpressionRecord() {
        expressionRecordStackView.addArrangedSubview(makeSubStackView())
        expressionRecordScrollView.scrollToBottom()
    }
}

extension MainViewController {
    private func changeToNumberFormatter(with sumOfOperands: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        let operandExpressionForm = numberFormatter.string(from: NSNumber(value: Double(sumOfOperands) ?? 0)) ?? ""
        return operandExpressionForm
    }
}
