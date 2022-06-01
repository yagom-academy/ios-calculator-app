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
        let operandLabel = currentOperandLabel.text ?? CalcAccessory.empty
        
        if sender.currentTitle == CalcAccessory.dot, currentOperandLabel.text?.contains(CalcAccessory.dot) == true {
            return
        }
        
        if operandLabel == CalcAccessory.zero,
            (sender.currentTitle == CalcAccessory.zero || sender.currentTitle == CalcAccessory.doubleZero) {
            return
        } else if operandLabel == CalcAccessory.zero, sender.currentTitle != CalcAccessory.dot {
            currentOperandLabel.text = CalcAccessory.empty
        }
        
        if operandLabel == CalcAccessory.nan {
            switch sender.currentTitle {
            case CalcAccessory.doubleZero, CalcAccessory.zero:
                currentOperandLabel.text = CalcAccessory.zero
                return
            case CalcAccessory.dot:
                currentOperandLabel.text = CalcAccessory.zero + CalcAccessory.dot
                return
            default:
                currentOperandLabel.text = CalcAccessory.empty
            }
        }
        
        currentOperandLabel?.text = (currentOperandLabel?.text ?? CalcAccessory.empty) + (sender.currentTitle ?? CalcAccessory.empty)
    }

    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currentOperandLabel.text != CalcAccessory.zero else {
            currentOperatorLabel.text = (sender.currentTitle ?? CalcAccessory.empty)
            return
        }
        
        if currentOperandLabel.text?.last == Character(CalcAccessory.dot) {
            currentOperandLabel.text?.removeLast()
        }
        
        addCurrentOperationToScrollViewContent()
        operationStack += "\(currentOperandLabel?.text ?? CalcAccessory.zero) \(sender.currentTitle ?? CalcAccessory.empty) "
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
        operationStack += currentOperandLabel.text ?? CalcAccessory.zero
        var formula = ExpressionParser.parse(from: operationStack)
        
        do {
            let operationResult = try formula.result()
            currentOperandLabel.text = changeDecimalStyle(String(operationResult))
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
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height - operationScrollView.bounds.height), animated: true)
    }
    
    private func changeDecimalStyle(_ input: String?) -> String {
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        numberFormmater.maximumSignificantDigits = 20
        
        return numberFormmater.string(for: Double(input ?? CalcAccessory.empty)) ?? CalcAccessory.empty
    }
}
