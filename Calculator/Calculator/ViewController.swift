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
    @IBAction func operandButtonDidTap(_ sender: UIButton) {
        if canAddOperand(to: operationStackView) == false {
            return
        } else if let operandLabelCount = currentOperandLabel.text?.replacingOccurrences(of: CalcAccessory.dot, with: CalcAccessory.empty).count, operandLabelCount >= 20 {
            return
        }
        
        let rawOperandLabel = changeDoubleStyle(currentOperandLabel.text)
        if rawOperandLabel.canInput(sender.currentTitle) == false {
            return
        } else if let number = processSpecificCase(about: sender.currentTitle) {
            currentOperandLabel.text = number
            return
        }
        
        let entireOperand = changeDoubleStyle(currentOperandLabel.text) + (sender.currentTitle ?? CalcAccessory.empty)
        if isZeroNumber(entireOperand) {
            currentOperandLabel.text = entireOperand
            return
        }
        
        currentOperandLabel?.text = applyNumberFormatterToInteger(entireOperand)
    }
    
    func processSpecificCase(about sender: String?) -> String? {
        guard let currentOperandLabel = currentOperandLabel.text,
              let sender = sender else {
            return nil
        }
        
        switch (sender, currentOperandLabel) {
        case (CalcAccessory.dot, CalcAccessory.zero), (CalcAccessory.dot, CalcAccessory.nan):
            return CalcAccessory.zero + CalcAccessory.dot
        case (CalcAccessory.doubleZero, CalcAccessory.nan), (CalcAccessory.zero, CalcAccessory.nan):
            return CalcAccessory.zero
        case ("1"..."9", CalcAccessory.nan):
            return sender
        default:
            return nil
        }
    }
    
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        guard currentOperandLabel.text != CalcAccessory.nan else {
            return
        }
        
        let operandLabel = changeDoubleStyle(currentOperandLabel.text)
        guard operandLabel != CalcAccessory.zero else {
            currentOperatorLabel.text = (sender.currentTitle ?? CalcAccessory.empty)
            return
        }
        
        if operandLabel.last == Character(CalcAccessory.dot) {
            currentOperandLabel.text?.removeLast()
        }
        addCurrentOperationToScrollViewContent()
        operationStack += "\(operandLabel) \(sender.currentTitle ?? CalcAccessory.empty) "
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
        } catch CalculatorError.dividedByZero {
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
        let currentOperationUILabel = createLabel(currentOperation)
        
        return currentOperationUILabel
    }
    
    private func createLabel(_ text: String) -> UILabel {
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
            return CalcAccessory.empty
        }
        
        let inputSplitedByDot: [String] = input.components(separatedBy: CalcAccessory.dot)
        let integerDigit = inputSplitedByDot[0]
        if inputSplitedByDot.count == 1 {
            return applyNumberFormatter(integerDigit)
        } else {
            return applyNumberFormatter(integerDigit) + CalcAccessory.dot + inputSplitedByDot[1]
        }
    }
    
    private func changeDoubleStyle(_ input: String?) -> String {
        return input?.replacingOccurrences(of: CalcAccessory.comma, with: CalcAccessory.empty) ?? CalcAccessory.empty
    }
    
    private func isZeroNumber(_ input: String) -> Bool {
        let removeDotNumber = input.replacingOccurrences(of: CalcAccessory.dot, with: CalcAccessory.empty)
        let removeZero = removeDotNumber.replacingOccurrences(of: CalcAccessory.zero, with: CalcAccessory.empty)
        
        return removeZero == CalcAccessory.empty ? true : false
    }
    
    private func canAddOperand(to stackView: UIStackView) -> Bool {
        if stackView.arrangedSubviews.count > 0 && currentOperatorLabel.text == CalcAccessory.empty {
            return false
        }
        
        return true
    }
}
