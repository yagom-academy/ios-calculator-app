//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var contentStack: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var expression: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabel()
        clearAllContentStack()
    }
    
    private func clearLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        guard let prevOperandLabel = operandLabel.text else { return }
        guard let inputNumber = sender.currentTitle else { return }
        
        if prevOperandLabel == "0" {
            if inputNumber == "0" || inputNumber == "00" {
                operandLabel.text = "0"
            } else {
                operandLabel.text = inputNumber
            }
            
            return
        }
        
        if prevOperandLabel.contains(".") {
            operandLabel.text = prevOperandLabel + inputNumber
        } else {
            operandLabel.text = convertNumberToString(prevOperandLabel + inputNumber)
        }
    }
    
    @IBAction private func commaButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false,
              let prevOperandLabel = operandLabel.text else { return }
        
        operandLabel.text = prevOperandLabel + "."
    }
    
    @IBAction private func chageSignButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else {
            return
        }
        
        if operandLabel.text?.contains("-") == true {
            operandLabel.text?.removeFirst()
            return
        }
        
        guard let prevOperandLabel = operandLabel.text else { return }

        operandLabel.text = "-" + prevOperandLabel
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0"  else {
            if !contentStack.subviews.isEmpty {
                operatorLabel.text = sender.currentTitle
            }
            
            return
        }
        
        guard let operatorText = operatorLabel.text,
              let operandText = operandLabel.text else { return }
        
        expression += operatorText + convertNumberToString(operandText)
        
        let stackView = generateStackView(convertNumberToString(operandText), operandText)
        addContentStack(stackView)
        setScrollViewFocus()
        
        operandLabel.text = "0"
        operatorLabel.text = sender.currentTitle
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard workingSpace != "" else { return }
        
        let stackView = generateStackView(operandLabel.text, operatorLabel.text)
        addContentStack(stackView)
        
        guard let operatorLabelText = operatorLabel.text else { return }
        workingSpace += operatorLabelText + operand
        
        var formula = ExpressionParser.parse(from: workingSpace)
        let result = formula.result()
        
        if result.isNaN {
            operandLabel.text = "NaN"
            operatorLabel.text = ""
            operand = ""
            workingSpace = ""
        } else {
            operandLabel.text = convertNumberToString(result)
            operatorLabel.text = ""
            operand = ""
            workingSpace = ""
        }
        
        setScrollViewFocus()
    }
    
    @IBAction private func clearAllButtonTapped(_ sender: UIButton) {
        workingSpace = ""
        operand = ""
        clearLabel()
        clearAllContentStack()
    }
    
    private func clearAllContentStack() {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func convertNumberToString(_ input: String) -> String {
        let numberFormatter = NumberFormatter()
        let removedComma = input.components(separatedBy: ",").joined()
        
        guard let inputToNSNumber = numberFormatter.number(from: removedComma) else {
            return input
        }
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .ceiling
        
        guard let result = numberFormatter.string(for: inputToNSNumber) else { return input }
        
        return result
    }
    
    private func addContentStack(_ subview: UIStackView) {
        contentStack.addArrangedSubview(subview)
    }
    
    private func generateStackView(_ operandText: String?, _ operatorText: String?) -> UIStackView {
        let operandLabel = generateUILabel(operandText)
        let operatorLabel = generateUILabel(operatorText)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }
    
    private func generateUILabel(_ text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func setScrollViewFocus() {
        if scrollView.contentSize.height < scrollView.bounds.size.height { return }
        scrollView.layoutIfNeeded()
        let bottomOffset: CGPoint = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
