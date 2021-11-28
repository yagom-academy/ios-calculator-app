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
    
    private func addNewLabelOnStackView() {
        guard var operandLabelText = operandLabel.text,
              let operatorLabelText = operatorLabel.text else { return }
        
        while operandLabelText.hasMeaninglessDecimal {
            operandLabelText.removeLast()
        }
        operandLabel.text = operandLabelText
        
        let singleItem = CalculatorSetting.adjustLabelAttributes()
        singleItem.text = "\(operatorLabelText)\(Character.whiteSpace)\(operandLabelText)"
        calculatorItemsStackView.addArrangedSubview(singleItem)
        CalculatorSetting.scrollToBottom(on: calculatorItemsScrollView)
    }
    
    private func clearAllStackViewLabel() {
        let addedStackViewLabels = calculatorItemsStackView.arrangedSubviews
        
        addedStackViewLabels.forEach { subview in
            return subview.removeFromSuperview()
        }
    }
    
    @IBAction func tappedResultButton(_ button: UIButton) {
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text,
              operatorLabelText.isNotEmpty else { return }
        
        appendCalculatorItem("\(operatorLabelText)")
        appendCalculatorItem("\(operandLabelText)")
        addNewLabelOnStackView()
        resetOperatorLabel()
        
        var parsedFormula = ExpressionParser.parse(from: calculatorItems)
        let calculatedResult = parsedFormula.result()
        operandLabel.text = CalculatorSetting.formatNumber(calculatedResult)
        resetCalculatorItems()
    }
    
    @IBAction func tappedOperandButton(_ button: UIButton) {
        guard var operandLabelText = operandLabel.text,
              let buttonTitle = button.currentTitle else { return }
        
        if operandLabelText == String.zero {
            operandLabelText = String.empty
        }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
    }
    
    @IBAction func tappedOperatorButton(_ button: UIButton) {
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text,
              operatorLabelText.isEmpty || operandLabelText != String.zero else {
                  operatorLabel.text = button.currentTitle
                  return
              }
        
        appendCalculatorItem("\(operatorLabelText)")
        appendCalculatorItem("\(operandLabelText)")
        addNewLabelOnStackView()
        resetOperandLabel()
        operatorLabel.text = button.currentTitle
    }
    
    @IBAction func tappedZeroButton(_ button: UIButton) {
        guard let operandLabelText = operandLabel.text,
              let buttonTitle = button.currentTitle,
              operandLabelText != String.zero else { return }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
    }
    
    @IBAction func tappedDecimalPointButton(_ button: UIButton) {
        guard let operandLabelText = operandLabel.text,
              let buttonTitle = button.currentTitle,
              operandLabelText.notContains(String.decimalPoint) else { return }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
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

