//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var savedCalculatorItems: String = ""
    private let emptyString: String = ""
    private let decimalPoint: String = "."
    private let decimalComma: String = ","
    private let negativeSign: String = "-"
    private let defaultOperandLabel: String = "0"
    private let numberFormatter = NumberFormatter()
    private let hapticGenerator = UISelectionFeedbackGenerator()
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var savedCalculatorItemsStackView: UIStackView!
    @IBOutlet weak var savedCalculatorItemsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyNumberFormatter()
    }
    
    private func applyNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
    }
    
    private func addStackViewLabel() {
        let savedItemlabel = UILabel()
        savedItemlabel.font = UIFont.preferredFont(forTextStyle: .title3)
        savedItemlabel.textColor = .white
        savedItemlabel.adjustsFontSizeToFitWidth = true
        
        if operandLabel.text!.contains(decimalPoint) {
            while operandLabel.text!.hasSuffix("0") || operandLabel.text!.hasSuffix(decimalPoint) {
                operandLabel.text!.removeLast()
            }
        }
        
        savedItemlabel.text = "\(operatorLabel.text!) \(operandLabel.text!)"
        savedCalculatorItemsStackView.addArrangedSubview(savedItemlabel)
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        savedCalculatorItemsScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(
            x: 0,
            y: savedCalculatorItemsScrollView.contentSize.height
             - savedCalculatorItemsScrollView.bounds.size.height
             + savedCalculatorItemsScrollView.contentInset.bottom)
        if(bottomOffset.y > 0) {
            savedCalculatorItemsScrollView.setContentOffset(bottomOffset, animated: false)
        }
    }
    
    private func clearAllStackViewLabel() {
        let addedStackViewLabels = savedCalculatorItemsStackView.arrangedSubviews
        
        addedStackViewLabels.forEach { subview in
            return subview.removeFromSuperview()
        }
    }
    
    @IBAction func resultButtonDidTouchUp(_ button: UIButton) {
        switch operatorLabel.text!.isEmpty {
        case true:
            return
        case false:
            saveCalculator(item: "\(operatorLabel.text!)")
            saveCalculator(item: "\(operandLabel.text!)")
            addStackViewLabel()
            resetOperatorLable()
            var parsedFormula = ExpressionParser.parse(from: savedCalculatorItems)
            let result = parsedFormula.result()
            operandLabel.text = numberFormatter.string(for: result)
            resetSavedCalculatorItems()
        }
    }
    
    @IBAction func operandButtonDidTouchUp(_ button: UIButton) {
        switch operandLabel.text! {
        case defaultOperandLabel:
            operandLabel.text = emptyString
            operandLabel.text! += button.currentTitle!
        default:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func operatorButtonDidTouchUp(_ button: UIButton) {
        switch operatorLabel.text!.isEmpty || operandLabel.text! != defaultOperandLabel {
        case true:
            saveCalculator(item: "\(operatorLabel.text!)")
            saveCalculator(item: "\(operandLabel.text!)")
            addStackViewLabel()
            resetOperandLable()
            operatorLabel.text = button.currentTitle
        case false:
            operatorLabel.text = button.currentTitle
        }
    }
    
    @IBAction func zeroButtonDidTouchUp(_ button: UIButton) {
        switch operandLabel.text! {
        case defaultOperandLabel:
            return
        default:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func decimalPointButtonDidTouchUp(_ button: UIButton) {
        switch operandLabel.text!.contains(decimalPoint) {
        case true:
            return
        case false:
            operandLabel.text! += button.currentTitle!
        }
    }
    
    @IBAction func changeSignButtonDidTouchUp(_ button: UIButton) {
        guard operandLabel.text! != defaultOperandLabel else {
            return
        }
        
        switch operandLabel.text!.hasPrefix(negativeSign) {
        case true:
            operandLabel.text!.removeFirst()
        case false:
            operandLabel.text! = negativeSign + operandLabel.text!
        }
    }
    
    @IBAction func allClearButtonDidTouchUp(_ button: UIButton) {
        resetSavedCalculatorItems()
        resetOperandLable()
        resetOperatorLable()
        clearAllStackViewLabel()
    }
    
    @IBAction func clearEntryButtonDidTouchUp(_ button: UIButton) {
        resetOperandLable()
    }
    
    @IBAction func occurHapticFeedback() {
        hapticGenerator.selectionChanged()
    }
    
    private func saveCalculator(item: String) {
        switch item.contains(decimalComma) {
        case true:
            let commaRemoveditem = item.components(separatedBy: decimalComma).joined()
            savedCalculatorItems += " \(commaRemoveditem)"
        case false:
            savedCalculatorItems += " \(item)"
        }
    }
    
    private func resetSavedCalculatorItems() {
        savedCalculatorItems = emptyString
    }
    
    private func resetOperandLable() {
        operandLabel.text = defaultOperandLabel
    }
    
    private func resetOperatorLable() {
        operatorLabel.text = emptyString
    }
}

