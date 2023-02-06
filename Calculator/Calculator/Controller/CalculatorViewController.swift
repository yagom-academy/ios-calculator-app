//
//  Calculator - CalculatorViewController.swift
//  Created by kokkilE on 2023/01/25.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var expression: String = DefaultValue.zero
    private var isOperateComplited = false
    
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var operatorUILabel: UILabel!
    @IBOutlet weak var operandUILabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        allClear()
    }
    
    private func allClear() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        operatorUILabel.text = DefaultValue.empty
        operandUILabel.text = DefaultValue.zero
        expression = DefaultValue.empty
    }

    @IBAction func touchUpCalculatorButton(sender: UIButton) {
        guard let inputFromButton = sender.titleLabel?.text else {
            return
        }
        
        processInput(from: inputFromButton)
    }
    
    private func processInput(from inputFromButton: String) {
        switch inputFromButton {
        case ButtonValue.AC:
            allClear()
        case ButtonValue.CE:
            clearEntry()
        case ButtonValue.SC:
            signChanger()
        case ButtonValue.add, ButtonValue.subtract, ButtonValue.divide, ButtonValue.multiply:
            processOperatorInput(inputFromButton)
        case ButtonValue.equal:
            processEqualSignInput()
            isOperateComplited = true
        case ButtonValue.dot:
            processDotInput(inputFromButton)
        default:
            if isOperateComplited {
                operandUILabel.text = DefaultValue.zero
                isOperateComplited = false
            }
            
            processNumberInput(inputFromButton)
        }
    }
    
    private func processDotInput(_ inputFromButton: String) {
        guard operandUILabel.text?.contains(SpecialCharacter.dot) == false,
              let prevOperandUILabel = operandUILabel.text else { return }
        
        operandUILabel.text = prevOperandUILabel + inputFromButton
    }
    
    private func processNumberInput(_ inputFromButton: String){
        guard let prevOperandUILabel = operandUILabel.text else { return }
        
        if prevOperandUILabel == DefaultValue.zero {
            if inputFromButton == ButtonValue.zero || inputFromButton == ButtonValue.twoZeros {
                operandUILabel.text = DefaultValue.zero
            } else {
                operandUILabel.text = inputFromButton
            }
            
            return
        }
        
        if prevOperandUILabel.contains(SpecialCharacter.dot) {
            operandUILabel.text = prevOperandUILabel + inputFromButton
        } else {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        }
    }
    
    private func clearEntry() {
        operandUILabel.text = DefaultValue.zero
    }
    
    private func signChanger() {
        guard operandUILabel.text != DefaultValue.zero else {
            return
        }
        
        if operandUILabel.text?.contains(SpecialCharacter.negativeNumber) == true {
            operandUILabel.text?.removeFirst()
            return
        }
        
        guard let prevOperandUILabel = operandUILabel.text else { return }

        operandUILabel.text = SpecialCharacter.negativeNumber + prevOperandUILabel
    }
    
    private func processOperatorInput(_ inputFromButton: String) {
        guard operandUILabel.text != DefaultValue.zero  else {
            if !scrollView.subviews.isEmpty {
                operatorUILabel.text = inputFromButton
            }
            
            return
        }
        
        stackInputToExpression()
        stackInputToScrollView()
        scrollToBottomOfScrollView()
        operandUILabel.text = DefaultValue.zero
        operatorUILabel.text = inputFromButton
    }
    
    private func processEqualSignInput() {
        guard operatorUILabel.text != DefaultValue.empty else { return }
    
        stackInputToExpression()
        stackInputToScrollView()
        scrollToBottomOfScrollView()
        calculateExpression()
    }
    
    private func stackInputToScrollView() {
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.text = operatorUILabel.text
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = UIColor.white
        
        if let operandUILabelText = operandUILabel.text {
            operandLabel.text = formattingNumber(for: operandUILabelText)
        }
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = UIColor.white
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        let spaceBetweenLabels = CGFloat(8)
        stackView.spacing = spaceBetweenLabels
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        scrollView.addArrangedSubview(stackView)
    }
    
    private func scrollToBottomOfScrollView() {
        guard let parentScrollView = scrollView.superview as? UIScrollView,
              let subviewHeight = scrollView.subviews.first?.bounds.size.height else { return }
        
        let bottomOffset = CGPoint(x: 0, y: parentScrollView.contentSize.height - parentScrollView.bounds.size.height + subviewHeight)
        
        if (bottomOffset.y > subviewHeight) {
            parentScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func stackInputToExpression() {
        guard let operatorText = operatorUILabel.text,
              let operandText = operandUILabel.text else { return }
        
        expression += operatorText + formattingNumber(for: operandText)
    }
    
    private func calculateExpression() {
        let removedComma = expression.components(separatedBy: SpecialCharacter.comma).joined()
        
        var formula = ExpressionParser.parse(from: removedComma)
        var result = String(formula.result())
        
        if result == "nan" {
            result = "NaN"
        } else {
            result = formattingNumber(for: result)
        }
        
        operandUILabel.text = result
        operatorUILabel.text = DefaultValue.empty
        expression = DefaultValue.empty
    }
    
    private func formattingNumber(for input: String) -> String {
        let formatter = NumberFormatter()
        let removedComma = input.components(separatedBy: SpecialCharacter.comma).joined()
        
        guard let inputToNSNumber = formatter.number(from: removedComma) else {
            return input
        }

        formatter.maximumFractionDigits = 20
        formatter.roundingMode = .ceiling
        formatter.numberStyle = .decimal
        
        guard let formattingResult = formatter.string(for: inputToNSNumber) else { return input }
        
        return formattingResult
    }
}

extension CalculatorViewController {
    private enum DefaultValue {
        static let empty = ""
        static let zero = "0"
    }
    
    private enum SpecialCharacter {
        static let comma = ","
        static let dot = "."
        static let negativeNumber = "-"
    }
    
    private enum ButtonValue {
        static let AC = "AC"
        static let CE = "CE"
        static let SC = "⁺⁄₋"
        static let add = String(Operator.add.rawValue)
        static let subtract = String(Operator.subtract.rawValue)
        static let divide = String(Operator.divide.rawValue)
        static let multiply = String(Operator.multiply.rawValue)
        static let equal = "="
        static let dot = "."
        static let zero = "0"
        static let twoZeros = "00"
    }
}
