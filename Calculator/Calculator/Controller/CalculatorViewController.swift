//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var previousContentStackView: UIStackView!
    @IBOutlet weak var previousExpressionScrollView: UIScrollView!
    private var expression: String = ""
    private var isResult: Bool = false
    private var isPlaceholder: Bool = true
    private let numberFormatter: NumberFormatter = {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 16
        numberFormatter.roundingMode = .halfUp
        
        return numberFormatter
    }()
    private var currentOperand: String {
        guard let operand = operandLabel.text else {
            return "NaN"
        }
        
        return operand.replacingOccurrences(of: ",", with: "")
    }
    private var currentOperandToDouble: Double {
        guard let operand = Double(currentOperand) else {
            return Double.nan
        }
        
        return operand
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        guard !isResult else {
            clearAll()
            return
        }
        
        operandLabel.text = "0"
        isResult = false
        isPlaceholder = true
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard currentOperand != "NaN" else {
            return
        }
        
        toggleSign()
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        
        addPreviousContentStackView()
        updateExpression()
        var formula: Formula = ExpressionParser.parse(from: expression)
        
        do {
            let result: Double = try formula.result()
            operandLabel.text = numberFormatter.string(from: NSNumber(value: result))
        } catch CalculatorError.missingOperand {
            print(CalculatorError.missingOperand.localized)
        } catch {
            print(error)
        }
        
        operatorLabel.text = ""
        expression = ""
        isResult = true
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard validateOperandInput(with: 1) else {
            return
        }
        guard let operandElement = sender.currentTitle else {
            return
        }
        guard currentOperandToDouble != Double.zero || currentOperand.contains(".") else {
            operandLabel.text = operandElement
            return
        }
        guard let newOperand = Double(currentOperand + operandElement) else {
            return
        }
        
        operandLabel.text = numberFormatter.string(from: NSNumber(value: newOperand))
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        inputZero(1)
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        inputZero(2)
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !isResult else {
            return
        }
        guard let decimalPointOperand = sender.currentTitle else {
            return
        }
        guard !currentOperand.contains(decimalPointOperand) else {
            return
        }
        
        operandLabel.text = (operandLabel.text ?? "0") + decimalPointOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard currentOperand != "NaN" else {
            return
        }
        guard currentOperand != "0" || isPlaceholder == false else {
            operatorLabel.text = sender.currentTitle
            expression = "0"
            return
        }
        
        addPreviousContentStackView()
        updateExpression()
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
        isResult = false
        isPlaceholder = true
    }
}

extension CalculatorViewController {
    private func clearLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func clearAll() {
        previousContentStackView.subviews.forEach { $0.removeFromSuperview() }
        clearLabel()
        expression = ""
        isResult = false
        isPlaceholder = true
    }
    
    private func toggleSign() {
        guard currentOperandToDouble != Double.zero else {
            return
        }
        
        if currentOperandToDouble == Double(Int(currentOperandToDouble)) {
            operandLabel.text = String(Int(currentOperandToDouble) * -1)
        } else {
            operandLabel.text = String(currentOperandToDouble * -1)
        }
    }
    
    private func inputZero(_ count: Int) {
        guard validateOperandInput(with: count) else {
            return
        }
        guard currentOperand != "0" else {
            isPlaceholder = false
            return
        }
        
        let newOperand = currentOperand + String(repeating: "0", count: count)
        let realNumber = newOperand.split(with: ".")
        
        guard let numberValue = Double(realNumber[0]),
              let integerNumber = numberFormatter.string(from: NSNumber(value: numberValue)) else {
            return
        }
        
        if realNumber.count == 1 {
            operandLabel.text = integerNumber
        } else {
            operandLabel.text = integerNumber + "." + String(realNumber[1])
        }
    }
    
    private func validateOperandInput(with textCount: Int) -> Bool {
        guard !isResult else {
            return false
        }
        
        return currentOperand.count + textCount < 16
    }
    
    private func updateExpression() {
        let operatorCase = operatorLabel.text ?? ""
        expression += operatorCase + currentOperand
    }
    
    private func addPreviousContentStackView() {
        let content: UIStackView = configureContentStackView()
        previousContentStackView.addArrangedSubview(content)
        scrollDown()
    }
    
    private func scrollDown() {
        previousExpressionScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: previousExpressionScrollView.contentSize.height - previousExpressionScrollView.bounds.size.height)
        previousExpressionScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func configureContentStackView() -> UIStackView {
        let recordedOperatorLabel: UILabel = configureItem(with: operatorLabel.text)
        let recordedOperandLabel: UILabel = configureItem(with: numberFormatter.string(from: NSNumber(value: currentOperandToDouble)))
        let content: UIStackView = addItemToContentStackView(item: recordedOperatorLabel, recordedOperandLabel)
        
        return content
    }
    
    private func addItemToContentStackView(item formula: UILabel...) -> UIStackView {
        let content: UIStackView = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.alignment = .fill
        content.distribution = .equalSpacing
        content.spacing = 8
        formula.forEach { content.addArrangedSubview($0) }
        
        return content
    }
    
    private func configureItem(with labelText: String?) -> UILabel {
        let recordedLabel: UILabel = UILabel()
        recordedLabel.font = .preferredFont(forTextStyle: .title3)
        recordedLabel.text = labelText
        recordedLabel.textColor = .white
        
        return recordedLabel
    }
}
