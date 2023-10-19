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
        static let nan: String = "NaN"
    }
    
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var scrollStackView: UIStackView!
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var currentOperand = CalculatorValue.emptyArray
    var currentOperator = CalculatorValue.emptyArray
    var inputString = CalculatorValue.emptyArray
    var resultString = CalculatorValue.emptyArray
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUI()
    }
  
    private func resetUI() {
        if currentOperand.isEmpty {
            operandLabel.text = CalculatorValue.zero
        } else {
            operandLabel.text = currentOperand
        }
        
        operatorLabel.text = currentOperator
    }
    
    @IBAction private func numberButtonDidTap(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return }
        
        if currentOperand.count < 20 {
            currentOperand += number
        
            operandLabel.text = currentOperand.numberFormatter()
        }
    }
    
    @IBAction private func dotButtonDidTap(_ sender: UIButton) {
        guard currentOperand.count < 20 &&
                !currentOperand.contains(Character(CalculatorValue.decimalPoint)) else { return }
   
        if currentOperand.isEmpty || currentOperand == CalculatorValue.minus {
            currentOperand += CalculatorValue.zeroDecimal
        } else {
            currentOperand += CalculatorValue.decimalPoint
        }
        
        operandLabel.text = currentOperand
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
        
        if currentOperand == CalculatorValue.minus {
            operandLabel.text = currentOperand + CalculatorValue.zero
        } else {
            operandLabel.text = currentOperand
        }
        operatorLabel.text = currentOperator
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func scrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: false)
    }
    
    private func addScrollStackView() {
        scrollStackView.addArrangedSubview(addListStackView())
        scrollToBottom()
    }
    
    @IBAction private func operatorButtonDidTap(_ sender: UIButton) {
        guard let operatorSymbol = sender.title(for: .normal) else { return }
        
        if !resultString.isEmpty {
            currentOperand = resultString
            resultString = CalculatorValue.emptyArray
        }
        
        guard !currentOperand.isEmpty else {
            currentOperator = operatorSymbol
            operatorLabel.text = currentOperator
            return
        }
        
        inputString += currentOperator
        inputString += currentOperand
        
        addScrollStackView()
        
        currentOperator = operatorSymbol
        currentOperand = CalculatorValue.emptyArray
        
        resetUI()
    }
    
    @IBAction private func allClearButtonDidTap(_ sender: Any) {
        inputString = CalculatorValue.emptyArray
        currentOperator = CalculatorValue.emptyArray
        currentOperand = CalculatorValue.emptyArray
        resultString = CalculatorValue.emptyArray
        
        resetUI()
        
        scrollStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func ClearEntryButtonDidTap(_ sender: Any) {
        currentOperand = CalculatorValue.emptyArray
        resetUI()
    }
    
    @IBAction private func plusMinusButtonDidTap(_ sender: Any) {
        if currentOperand.first == Character(CalculatorValue.minus) {
            currentOperand.remove(at: currentOperand.startIndex)
        } else {
            currentOperand = CalculatorValue.minus + currentOperand
        }
        
        if currentOperand == CalculatorValue.minus {
            operandLabel.text = currentOperand + CalculatorValue.zero
        } else {
            operandLabel.text = currentOperand
        }
    }
    
    @IBAction private func equalButtonDidTap(_ sender: Any) {
        inputString += currentOperator + currentOperand
        
        guard !inputString.contains(CalculatorValue.nan) else {
            operandLabel.text = CalculatorValue.nan
            resultString = CalculatorValue.nan
            return
        }
        
        var formula = ExpressionParser.parse(from: inputString)
        let result = formula.result()
        
        if result.isNaN {
            resultString = CalculatorValue.nan
        } else if result.haveDecimalPlace() {
            resultString = String(result).numberFormatter()
        } else {
            resultString = String(Int(result))
        }
        operandLabel.text = resultString
        operatorLabel.text = CalculatorValue.emptyArray
        
        currentOperand = CalculatorValue.emptyArray
        currentOperator = CalculatorValue.emptyArray
        inputString = CalculatorValue.emptyArray
        
        scrollStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

