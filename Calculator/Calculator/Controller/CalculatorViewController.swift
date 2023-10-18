//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    enum CalculatorValue {
        static let emptyArray: String = ""
        static let zero: String = "0"
        static let zeroDecimal: String = "0."
        static let decimalPoint: String = "."
        static let minus: String = "-"
    }
    
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var scrollStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var listStackView: UIStackView!
    
    var operandNumber = CalculatorValue.emptyArray
    var formulaNumber = CalculatorValue.emptyArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
    }
    
    private func initializeUI() {
        operandLabel.text = CalculatorValue.zero
        operatorLabel.text = CalculatorValue.emptyArray
        scrollStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func numberButtonDidTap(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return }
        
        if operandNumber.count < 20 {
            operandNumber += number
            operandLabel.text = numberFormatter(operand: operandNumber)
        } else if operandNumber.contains(Character(CalculatorValue.decimalPoint)) && operandNumber.count < 20 {
            operandNumber += number
            operandLabel.text = operandNumber
        }
    }
    
    @IBAction private func dotButtonDidTap(_ sender: UIButton) {
        if operandNumber.isEmpty {
            operandNumber = CalculatorValue.zeroDecimal
            operandLabel.text = numberFormatter(operand: operandNumber)
        } else if operandNumber.last == Character(CalculatorValue.decimalPoint) || operandNumber.count == 20 || operandNumber.contains(Character(CalculatorValue.decimalPoint)) {
            operandLabel.text = numberFormatter(operand: operandNumber)
        } else {
            operandNumber += CalculatorValue.decimalPoint
            operandLabel.text = operandNumber
        }
    }
    
    @IBAction private func operatorButtonDidTap(_ sender: UIButton) {
        guard let operatorSymbol = sender.title(for: .normal) else { return }
        
        if operandLabel.text == CalculatorValue.zero {
            operatorLabel.text = operatorSymbol
        } else {
            formulaNumber += operatorLabel.text ?? CalculatorValue.emptyArray
            formulaNumber += operandLabel.text ?? CalculatorValue.emptyArray
            addScrollStackView()
            operandNumber = CalculatorValue.emptyArray
            operandLabel.text = CalculatorValue.zero
            operatorLabel.text = operatorSymbol
        }
    }
    
    @IBAction private func allClearButtonDidTap(_ sender: Any) {
        initializeUI()
        formulaNumber = CalculatorValue.emptyArray
        operandNumber = CalculatorValue.emptyArray
    }
    
    @IBAction private func ceButtonDidTap(_ sender: Any) {
        operandLabel.text = CalculatorValue.zero
        operandNumber = CalculatorValue.emptyArray
    }
    
    @IBAction private func plusMinusButtonDidTap(_ sender: Any) {
        if operandNumber.first == Character(CalculatorValue.minus) {
            operandNumber.remove(at: operandNumber.startIndex)
            operandLabel.text = operandNumber
        } else {
            operandNumber = CalculatorValue.minus + operandNumber
            operandLabel.text = operandNumber
        }
    }
    
    @IBAction private func equalButtonDidTap(_ sender: Any) {
        formulaNumber += operatorLabel.text ?? CalculatorValue.emptyArray
        
        if operandNumber == CalculatorValue.emptyArray {
            formulaNumber += CalculatorValue.emptyArray
        } else {
            formulaNumber += operandLabel.text ?? CalculatorValue.emptyArray
        }
        
        var formula = ExpressionParser.parse(from: formulaNumber)
        let result = formula.result()
        
        initializeUI()
        
        
        if result.isNaN {
            operandLabel.text = "NaN"
        } else if result.haveDecimalPlace() {
            operandLabel.text = String(result)
        } else {
            operandLabel.text = String(Int(result))
        }
        
        operandNumber = CalculatorValue.emptyArray
        formulaNumber = CalculatorValue.emptyArray
    }
    
    private func addListStackView() -> UIStackView {
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        let stackView = UIStackView()
        
        stackView.spacing = 8
        operandLabel.textColor = .white
        operatorLabel.textColor = .white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.text = self.operatorLabel.text
        operandLabel.text = self.operandLabel.text
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func addScrollStackView() {
        scrollStackView.addArrangedSubview(addListStackView())
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: false)
    }
    
    private func numberFormatter(operand: String) -> String {
        guard let doubleOperand = Double(operand) else { return CalculatorValue.emptyArray }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(from: NSNumber(value: doubleOperand)) ?? CalculatorValue.emptyArray
    }
}

