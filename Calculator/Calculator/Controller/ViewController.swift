//
//  Calculator - ViewController.swift
//  Created by kokkilE on 2023/01/25.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expression: String = ""
    var constraintsOfLabelView: [NSLayoutConstraint]?
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var operatorUILabel: UILabel!
    @IBOutlet weak var operandUILabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpCalculatorButton(sender: UIButton) {
        guard let inputFromButton = sender.titleLabel?.text else {
            return
        }
        
        processInput(from: inputFromButton)
    }
    
    func processInput(from inputFromButton: String) {
        switch inputFromButton {
        case "AC":
            return
        case "CE":
            return
        case "⁺⁄₋":
            return
        case "+", "−", "÷", "×":
            return
        case "=":
            return
        case "0", "00":
            return
        case ".":
            processDotInput(inputFromButton)
        default:
            processNumberInput(inputFromButton)
        }
    }
    
    func processDotInput(_ inputFromButton: String) {
        guard operandUILabel.text?.contains(".") == false,
              let prevOperandUILabel = operandUILabel.text else { return }
        
        operandUILabel.text = prevOperandUILabel + inputFromButton
    }
    
    func processNumberInput(_ inputFromButton: String){
        guard let prevOperandUILabel = operandUILabel.text else { return }
        
        if operandUILabel.text == "0" {
            operandUILabel.text = inputFromButton == "0" || inputFromButton == "00" ? "0" : inputFromButton
            return
        }
        
        if !prevOperandUILabel.contains(".") {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        } else {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        }
    }
    
    func allClear() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        operatorUILabel.text = ""
        operandUILabel.text = "0"
        expression = ""
    }
    
    func clearEntry() {
        operandUILabel.text = "0"
    }
    
    func signChanger() {
        guard operandUILabel.text != "0" else {
            return
        }
        
        if operandUILabel.text?.contains("-") == true {
            operandUILabel.text?.removeFirst()
            return
        }
        
        guard let prevOperandUILabel = operandUILabel.text else { return }

        operandUILabel.text = "-" + prevOperandUILabel
    }
    
    func processOperatorInput(_ inputFromButton: String) {
        guard operandUILabel.text != "0"  else {
            if !scrollView.subviews.isEmpty {
                operatorUILabel.text = inputFromButton
            }
            
            return
        }
        
        stackInputToExpression()
        stackInputToScrollView()
        operandUILabel.text = "0"
        operatorUILabel.text = inputFromButton
    }
    
    func processEqualSignInput() {
        guard operatorUILabel.text != "" else { return }
    
        stackInputToExpression()
        stackInputToScrollView()
        calculateExpression()
    }
    
    func processZeroInput(_ inputFromButton: String) {
        guard operandUILabel.text != "0",
              let prevOperandUILabel = operandUILabel.text else { return }
                
        if !prevOperandUILabel.contains(".") {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        } else {
            operandUILabel.text = prevOperandUILabel + inputFromButton
        }
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
        stackView.spacing = stackView.spacing + 8
        
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        scrollView.addArrangedSubview(stackView)
        scrollToBottomOfScrollView()
    }
    
    func scrollToBottomOfScrollView() {
        guard let parentScrollView = scrollView.superview as? UIScrollView else { return }
        
        let bottomOffset = CGPoint(x: 0, y: parentScrollView.contentSize.height - parentScrollView.bounds.size.height + 25 + parentScrollView.contentInset.bottom)
        if(bottomOffset.y > 25) {
            parentScrollView.setContentOffset(bottomOffset, animated: true)
        }        
    }
    
    func stackInputToExpression() {
        guard let operatorText = operatorUILabel.text,
              var operandText = operandUILabel.text?.components(separatedBy: ",").joined() else { return }
        
        if !operandText.contains(".") {
            operandText = formattingNumber(for: operandText)
        }
        
        expression += operatorText + operandText
    }
    
    func calculateExpression() {
        expression = expression.components(separatedBy: ",").joined()
        
        var formula = ExpressionParser.parse(from: expression)
        var result = String(formula.result())
        
        if result == "nan" {
            result = "NaN"
        } else {
            result = cutZerosAfterDecimalPoint(for: result)
            result = formattingNumber(for: result)
        }
        
        operandUILabel.text = result
        operatorUILabel.text = ""
        expression = ""
    }
    
    func cutZerosAfterDecimalPoint(for input: String) -> String {
        guard input.contains(".") else {
            return input
        }
        
        var splitedByDot = input.components(separatedBy: ".")
        
        while splitedByDot[1].last == "0" {
            _ = splitedByDot[1].popLast()
        }
        
        if splitedByDot[1].isEmpty {
            return splitedByDot[0]
        }
        return splitedByDot[0] + "." + splitedByDot[1]
    }
    
    func formattingNumber(for input: String) -> String {
        let formatter = NumberFormatter()
        
        let removedComma = input.components(separatedBy: ",").joined()
        
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

