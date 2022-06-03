//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operationScrollView: UIScrollView!
    @IBOutlet weak var operationStackView: UIStackView!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    private var operationStack: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperationScrollviewContent()
        clearCurrentOperandLabel()
        clearCurrentOperatorLabel()
    }
    
    // MARK: - IBAction
    @IBAction func pressOperandButton(_ sender: UIButton) {
        if let operandLabelCount = currentOperandLabel.text?.replacingOccurrences(of: ".", with: "").count, operandLabelCount >= 20 {
            return
        }
        
        let operandLabel = changeDoubleStyle(currentOperandLabel.text ?? "")
        
        if (sender.currentTitle ?? "").canInput(operandLabel) == false {
            return
        }
        
        if let number = sender.currentTitle?.canReturn(operandLabel) {
            currentOperandLabel.text = number
            return
        }
        
        let doubleStyleOperand = changeDoubleStyle(currentOperandLabel.text) + (sender.currentTitle ?? "")
        
        if isZeroNumber(doubleStyleOperand) {
            currentOperandLabel.text = doubleStyleOperand
            return
        }
            
        currentOperandLabel?.text = applyNumberFormatterToInteger(doubleStyleOperand)
    }
    
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currentOperandLabel.text != CalcAccessory.nan else {
            return
        }
        
        let doubleStyleOperandLabel = changeDoubleStyle(currentOperandLabel.text)
        guard doubleStyleOperandLabel != CalcAccessory.zero else {
            currentOperatorLabel.text = (sender.currentTitle ?? CalcAccessory.empty)
            return
        }
        
        if doubleStyleOperandLabel.last == Character(CalcAccessory.dot) {
            currentOperandLabel.text?.removeLast()
        }
        
        addCurrentOperationToScrollViewContent()
        operationStack += "\(doubleStyleOperandLabel) \(sender.currentTitle ?? CalcAccessory.empty) "
        currentOperatorLabel.text = sender.currentTitle
        clearCurrentOperandLabel()
        scrollToBottom()
    }
    
    @IBAction func allClearButtonDidTap(_ sender: UIButton) {
        operationStack = CalcAccessory.empty
        clearOperationScrollviewContent()
        clearCurrentOperandLabel()
        clearCurrentOperatorLabel()
    }
    
    @IBAction func clearEntryButtonDidTap(_ sender: UIButton) {
        clearCurrentOperandLabel()
    }
    
    @IBAction func reverseSignButtonDidTap(_ sender: UIButton) {
        guard let operandDisplayed = currentOperandLabel.text, operandDisplayed != CalcAccessory.nan else {
            return
        }
        
        guard canAttachMinus(to: operandDisplayed) == true else {
            return
        }
        
        if currentOperandLabel.text?.first == "-" {
            currentOperandLabel.text?.removeFirst()
        } else {
            currentOperandLabel.text = "-" + (currentOperandLabel.text ?? CalcAccessory.empty)
        }
    }
    
    func canAttachMinus(to operand: String) -> Bool {
        var result = CalcAccessory.empty
        
        if operand.contains(CalcAccessory.dot) {
            result = operand.replacingOccurrences(of: CalcAccessory.dot, with: CalcAccessory.empty)
        } else {
            result = operand
        }
        
        result = result.replacingOccurrences(of: CalcAccessory.zero, with: CalcAccessory.empty)
        
        if result == CalcAccessory.empty {
            return false
        }
        
        return true
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        guard currentOperatorLabel.text != CalcAccessory.empty else {
            return
        }
        
        addCurrentOperationToScrollViewContent()
        operationStack += changeDoubleStyle(currentOperandLabel.text)
        var formula = ExpressionParser.parse(from: operationStack)
        
        do {
            let operationResult = try formula.result()
            currentOperandLabel.text = applyNumberFormatter(String(operationResult))
        } catch CalculatorError.divideByZero {
            currentOperandLabel.text = CalcAccessory.nan
        } catch {
            debugPrint("UNKNOWN ERROR")
        }
        
        clearCurrentOperatorLabel()
        operationStack = CalcAccessory.empty
        scrollToBottom()
    }
    
    private func clearCurrentOperandLabel() {
        currentOperandLabel.text = CalcAccessory.zero
    }
    
    private func clearCurrentOperatorLabel() {
        currentOperatorLabel.text = CalcAccessory.empty
    }
    
    private func clearOperationScrollviewContent() {
        operationStackView.subviews.forEach { UIView in
            UIView.removeFromSuperview()
        }
    }
}

//MARK: - UI Components
extension ViewController {
    private func addCurrentOperationToScrollViewContent() {
        let currentContent = createOpearionStackViewContent(
            inputOperator: currentOperatorLabel.text ?? CalcAccessory.empty,
            inputOperand: currentOperandLabel.text ?? CalcAccessory.empty
        )
        operationStackView.addArrangedSubview(currentContent)
    }
    
    private func createOpearionStackViewContent(inputOperator: String, inputOperand: String) -> UILabel {
        let currentOperation = "\(inputOperator) \(inputOperand)"
        let currentOperationUILabel = createUILabel(currentOperation)
        
        return currentOperationUILabel
    }
    
    private func createUILabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3, compatibleWith: nil)
        label.text = text
        label.textAlignment = .center
        
        return label
    }
    
    private func scrollToBottom() {
        operationScrollView.layoutIfNeeded()
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height - operationScrollView.bounds.height), animated: true)
    }
    
    private func applyNumberFormatter(_ input: String?) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .floor
        numberFormatter.minimumSignificantDigits = 0
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(for: Double(input ?? CalcAccessory.empty)) ?? CalcAccessory.empty
    }
    
    private func applyNumberFormatterToInteger(_ input: String?) -> String {
        guard let input = input else {
            return ""
        }
        let splitedInput: [String] = input.components(separatedBy: ".")
        let integerDigit = splitedInput[0]
        if splitedInput.count == 1 {
            return applyNumberFormatter(integerDigit)
        } else {
            return applyNumberFormatter(integerDigit) + "." + splitedInput[1]
        }
    }
    
    private func changeDoubleStyle(_ input: String?) -> String {
        return input?.replacingOccurrences(of: ",", with: "") ?? ""
    }
    
    private func isZeroNumber(_ input: String) -> Bool {
        let removeDotNumber = input.replacingOccurrences(of: ".", with: "")
        let removeZero = removeDotNumber.replacingOccurrences(of: "0", with: "")
        return removeZero == "" ? true : false
    }
}
