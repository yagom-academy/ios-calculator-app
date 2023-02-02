//
//  Calculator - ViewController.swift
//  Created by kokkilE on 2023/01/25.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    enum DefaultValue {
        static let empty = ""
        static let zero = "0"
    }
    
    enum SpecialCharacter {
        static let comma = ","
        static let dot = "."
        static let negativeNumber = "-"
    }
    
    enum ButtonID {
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
    
    var expression: String = DefaultValue.zero
    var isOperateComplited = false
    
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var operatorUILabel: UILabel!
    @IBOutlet weak var operandUILabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         2. 숫자 20자리만 표기 /-1,36/1.801/57480/31496
         4. 자동 스크롤
         */
        allClear()
    }

    @IBAction func touchUpCalculatorButton(sender: UIButton) {
        guard let inputFromButton = sender.titleLabel?.text else {
            return
        }
        
        processInput(from: inputFromButton)
    }
    
    func processInput(from inputFromButton: String) {
        switch inputFromButton {
        case ButtonID.AC:
            allClear()
        case ButtonID.CE:
            clearEntry()
        case ButtonID.SC:
            signChanger()
        case ButtonID.add, ButtonID.subtract, ButtonID.divide, ButtonID.multiply:
            processOperatorInput(inputFromButton)
        case ButtonID.equal:
            processEqualSignInput()
            isOperateComplited = true
        case ButtonID.dot:
            processDotInput(inputFromButton)
        default:
            if isOperateComplited {
                operandUILabel.text = DefaultValue.zero
                isOperateComplited = false
            }
            
            processNumberInput(inputFromButton)
        }
    }
    
    func processDotInput(_ inputFromButton: String) {
        guard operandUILabel.text?.contains(SpecialCharacter.dot) == false,
              let prevOperandUILabel = operandUILabel.text else { return }
        
        operandUILabel.text = prevOperandUILabel + inputFromButton
    }
    
    func processNumberInput(_ inputFromButton: String){
        guard let prevOperandUILabel = operandUILabel.text else { return }
        
        if prevOperandUILabel == DefaultValue.zero {
            if inputFromButton == ButtonID.zero || inputFromButton == ButtonID.twoZeros {
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
    
    func allClear() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        operatorUILabel.text = DefaultValue.empty
        operandUILabel.text = DefaultValue.zero
        expression = DefaultValue.empty
    }
    
    func clearEntry() {
        operandUILabel.text = DefaultValue.zero
    }
    
    func signChanger() {
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
    
    func processOperatorInput(_ inputFromButton: String) {
        guard operandUILabel.text != DefaultValue.zero  else {
            if !scrollView.subviews.isEmpty {
                operatorUILabel.text = inputFromButton
            }
            
            return
        }
        
        stackInputToExpression()
        stackInputToScrollView()
        operandUILabel.text = DefaultValue.zero
        operatorUILabel.text = inputFromButton
    }
    
    func processEqualSignInput() {
        guard operatorUILabel.text != DefaultValue.empty else { return }
    
        stackInputToExpression()
        stackInputToScrollView()
        calculateExpression()
    }
    
    func stackInputToScrollView() {
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.text = operatorUILabel.text
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = UIColor.white
        
        if let operandUILabelText = operandUILabel.text {
            operandLabel.text = cutZerosAfterDecimalPoint(for: operandUILabelText)
        }
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = UIColor.white
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        let spaceBetweenLabels = CGFloat(8)
        stackView.spacing = stackView.spacing + spaceBetweenLabels
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        scrollView.addArrangedSubview(stackView)
        scrollToBottomOfScrollView()
    }
    
    func scrollToBottomOfScrollView() {
        guard let parentScrollView = scrollView.superview as? UIScrollView else { return }
        
        let bottomOffset = CGPoint(x: 0, y: parentScrollView.contentSize.height - parentScrollView.bounds.size.height)
                
        parentScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    func stackInputToExpression() {
        guard let operatorText = operatorUILabel.text,
              var operandText = operandUILabel.text else { return }
        
        expression += operatorText + formattingNumber(for: operandText)
    }
    
    func calculateExpression() {
        let removedComma = expression.components(separatedBy: SpecialCharacter.comma).joined()
        
        var formula = ExpressionParser.parse(from: removedComma)
        var result = String(formula.result())
        
        if result == "nan" {
            result = "NaN"
        } else {
            result = cutZerosAfterDecimalPoint(for: result)
            result = formattingNumber(for: result)
        }
        
        operandUILabel.text = result
        operatorUILabel.text = DefaultValue.empty
        expression = DefaultValue.empty
    }
    
    func cutZerosAfterDecimalPoint(for input: String) -> String {
        let zeroForRemove: Character = "0"
        
        guard input.contains(SpecialCharacter.dot) else {
            return input
        }
        
        var splitedByDot = input.components(separatedBy: SpecialCharacter.dot)
        
        while splitedByDot[1].last == zeroForRemove {
            _ = splitedByDot[1].popLast()
        }
        
        if splitedByDot[1].isEmpty {
            return splitedByDot[0]
        }
        return splitedByDot[0] + SpecialCharacter.dot + splitedByDot[1]
    }
    
    func formattingNumber(for input: String) -> String {
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
