//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var calculatorItems = String.empty
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculatorItemsStackView: UIStackView!
    @IBOutlet weak var calculatorItemsScrollView: UIScrollView!
    
    private func addStackViewLabel() {
        let savedItemlabel = UILabel()
        savedItemlabel.font = UIFont.preferredFont(forTextStyle: .title3)
        savedItemlabel.textColor = .white
        savedItemlabel.adjustsFontSizeToFitWidth = true
        
        if operandLabel.text!.contains(String.decimalPoint) {
            while operandLabel.text!.hasSuffix("0") || operandLabel.text!.hasSuffix(String.decimalPoint) {
                operandLabel.text!.removeLast()
            }
        }
        
        savedItemlabel.text = "\(operatorLabel.text!) \(operandLabel.text!)"
        calculatorItemsStackView.addArrangedSubview(savedItemlabel)
        CalculatorSetting.scrollToBottom(on: calculatorItemsScrollView)
    }
    
    private func clearAllStackViewLabel() {
        let addedStackViewLabels = calculatorItemsStackView.arrangedSubviews
        
        addedStackViewLabels.forEach { subview in
            return subview.removeFromSuperview()
        }
    }
    
    @IBAction func tappedResultButton(_ button: UIButton) {
        switch operatorLabel.text!.isEmpty {
        case true:
            return
        case false:
            appendCalculatorItem("\(operatorLabel.text!)")
            appendCalculatorItem("\(operandLabel.text!)")
            addStackViewLabel()
            resetOperatorLabel()
            var parsedFormula = ExpressionParser.parse(from: calculatorItems)
            let calculatedResult = parsedFormula.result()
            operandLabel.text = CalculatorSetting.formatNumber(calculatedResult)
            resetCalculatorItems()
        }
    }
    
    @IBAction func tappedOperandButton(_ button: UIButton) {
        switch operandLabel.text! {
        case String.zero:
            operandLabel.text = String.empty
            operandLabel.text! += button.currentTitle!
        default:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func tappedOperatorButton(_ button: UIButton) {
        switch operatorLabel.text!.isEmpty || operandLabel.text! != String.zero {
        case true:
            appendCalculatorItem("\(operatorLabel.text!)")
            appendCalculatorItem("\(operandLabel.text!)")
            addStackViewLabel()
            resetOperandLabel()
            operatorLabel.text = button.currentTitle
        case false:
            operatorLabel.text = button.currentTitle
        }
    }
    
    @IBAction func tappedZeroButton(_ button: UIButton) {
        guard let buttonTitle = button.currentTitle,
              var operandLabelText = operandLabel.text else { return }
        
        if operandLabelText != String.zero {
            operandLabelText += buttonTitle
            operandLabel.text = operandLabelText
        }
    }
    
    @IBAction func tappedDecimalPointButton(_ button: UIButton) {
        switch operandLabel.text!.contains(String.decimalPoint) {
        case true:
            return
        case false:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func tappedChangeSignButton(_ button: UIButton) {
        guard operandLabel.text! != String.zero else {
            return
        }
        
        switch operandLabel.text!.hasPrefix(String.negativeSign) {
        case true:
            operandLabel.text!.removeFirst()
        case false:
            operandLabel.text! = String.negativeSign + operandLabel.text!
        }
    }
    
    @IBAction func tappedAllClearButton(_ button: UIButton) {
        resetCalculatorItems()
        resetOperandLabel()
        resetOperatorLabel()
        clearAllStackViewLabel()
    }
    
    @IBAction func tappedClearEntryButton(_ button: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction func occurHapticFeedback() {
        CalculatorSetting.occurHapticFeedback()
    }
    
    private func appendCalculatorItem(_ item: String) {
        switch item.contains(String.decimalComma) {
        case true:
            let commaRemoveditem = item.components(separatedBy: String.decimalComma).joined()
            calculatorItems += " \(commaRemoveditem)"
        case false:
            calculatorItems += " \(item)"
        }
    }
    
    private func resetCalculatorItems() {
        calculatorItems = String.empty
    }
    
    private func resetOperandLabel() {
        operandLabel.text = String.zero
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = String.empty
    }
}

