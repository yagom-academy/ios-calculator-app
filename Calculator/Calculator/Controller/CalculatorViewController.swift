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
    
    private var workingSpace: String = ""
    private var operand = ""
    
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
        if let number = sender.currentTitle {
            operand += number
        }
        
        guard let operandDouble = Double(operand) else { return }
        operandLabel.text = convertNumberToString(operandDouble)
    }
    
    @IBAction private func zeroAndCommaButtonTapped(_ sender: UIButton) {
        if operandLabel.text == "0" && sender.currentTitle != "." {
            return
        } else if operandLabel.text == "0" && sender.currentTitle == "." {
            operand += "0."
            operandLabel.text = operand
        } else if operand.contains(".") && sender.currentTitle == "." {
            return
        } else if operandLabel.text != "0" && sender.currentTitle == "." {
            if let operandLabelText = operandLabel.text {
                operandLabel.text = operandLabelText + "."
                operand += "."
            }
        } else {
            if let input = sender.currentTitle {
                operand += input
            }
            
            guard let operandDouble = Double(operand) else { return }
            operandLabel.text = convertNumberToString(operandDouble)
        }
    }
    
    
    @IBAction private func chageSignButtonTapped(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if var operand = Int(operandLabelText) {
            operand = -operand
            operandLabel.text = String(operand)
        } else if var operand = Double(operandLabelText) {
            operand = -operand
            operandLabel.text = String(operand)
        }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        operand = ""
        operandLabel.text = "0"
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard var operandLabelText = operandLabel.text else { return }
        guard let `operator` = sender.currentTitle else { return }
        
        if operandLabelText.contains(",") {
            operandLabelText = operandLabelText.split(with: ",").joined()
        }
        
        if operatorLabel.text == "" && operandLabelText != "0" {
            guard let operandDouble = Double(operandLabelText) else { return }
            let stackView = generateStackView(convertNumberToString(operandDouble), "")
            addContentStack(stackView)
            
            workingSpace += operandLabelText
            setOperatorLabel(`operator`)
        } else if operatorLabel.text == "" && operandLabelText == "0" {
            return
        } else if operatorLabel.text != "" && operandLabelText == "0" {
            setOperatorLabel(`operator`)
            
            return
        } else {
            guard let operandDouble = Double(operandLabelText) else { return }
            let stackView = generateStackView(convertNumberToString(operandDouble), operatorLabel.text)
            addContentStack(stackView)
            
            guard let operatorLabelText = operatorLabel.text else { return }
            workingSpace += operatorLabelText + operandLabelText
            
            setOperatorLabel(`operator`)
        }
        
        setScrollViewFocus()
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
    
    private func setOperatorLabel(_ `operator`: String) {
        operatorLabel.text = `operator`
        operand = ""
        operandLabel.text = "0"
    }
    
    private func clearAllContentStack() {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func convertNumberToString(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        let result = numberFormatter.string(for: input) ?? "0"
        
        return result
    }
    
    private func addContentStack(_ subview: UIStackView) {
        contentStack.addArrangedSubview(subview)
    }
    
    private func generateStackView(_ operandText: String?, _ operatorText: String?) -> UIStackView {
        let operandLabel = UILabel()
        operandLabel.text = operandText
        operandLabel.textColor = UIColor.white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let operatorLabel = UILabel()
        operatorLabel.text = operatorText
        operatorLabel.textColor = UIColor.white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }
    
    private func setScrollViewFocus() {
        if scrollView.contentSize.height < scrollView.bounds.size.height { return }
        scrollView.layoutIfNeeded()
        let bottomOffset: CGPoint = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
