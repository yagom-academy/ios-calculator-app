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
    
    private func unwrapLabelText(of label: UILabel) -> String {
        guard let labelText = label.text else { return String.empty }
        
        return labelText
    }
    
    private func unwrapButtonTitle(of button: UIButton) -> String {
        guard let buttonTitle = button.currentTitle else { return String.empty }
        
        return buttonTitle
    }
    
    private func addNewLabelOnStackView() {
        var operandLabelText = unwrapLabelText(of: operandLabel)
        let operatorLabelText = unwrapLabelText(of: operatorLabel)
        
        operandLabel.text = operandLabelText.removeUnnecessaryDecimal()
        
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
        let operandLabelText = unwrapLabelText(of: operandLabel)
        let operatorLabelText = unwrapLabelText(of: operatorLabel)
        guard operatorLabelText.isNotEmpty else { return }
        
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
        var operandLabelText = unwrapLabelText(of: operandLabel)
        let buttonTitle = unwrapButtonTitle(of: button)
        
        if operandLabelText == String.zero {
            operandLabelText = String.empty
        }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
    }
    
    @IBAction func tappedOperatorButton(_ button: UIButton) {
        let operandLabelText = unwrapLabelText(of: operandLabel)
        let operatorLabelText = unwrapLabelText(of: operatorLabel)
        guard operatorLabelText.isEmpty || operandLabelText != String.zero else {
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
        let operandLabelText = unwrapLabelText(of: operandLabel)
        let buttonTitle = unwrapButtonTitle(of: button)
        guard operandLabelText != String.zero else { return }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
    }
    
    @IBAction func tappedDecimalPointButton(_ button: UIButton) {
        let operandLabelText = unwrapLabelText(of: operandLabel)
        let buttonTitle = unwrapButtonTitle(of: button)
        guard operandLabelText.notContains(String.decimalPoint) else { return }
        
        operandLabel.text = "\(operandLabelText)\(buttonTitle)"
    }
    
    @IBAction func tappedChangeSignButton(_ button: UIButton) {
        var operandLabelText = unwrapLabelText(of: operandLabel)
        guard operandLabelText != String.zero else { return }
        guard operandLabelText.hasPrefix(String.negativeSign) else {
            operandLabel.text = "\(String.negativeSign)\(operandLabelText)"
            return
        }
        
        operandLabelText.removeFirst()
        operandLabel.text = operandLabelText
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
        guard item.contains(String.decimalComma) else {
            calculatorItems = "\(calculatorItems)\(Character.whiteSpace)\(item)"
            return
        }

        let commaRemovedItem = item.components(separatedBy: String.decimalComma)
                                   .joined()
        calculatorItems = "\(calculatorItems)\(Character.whiteSpace)\(commaRemovedItem)"
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

