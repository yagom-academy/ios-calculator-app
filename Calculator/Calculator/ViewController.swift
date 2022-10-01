//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    private var expression: String = ""
    
    @IBOutlet private weak var operandAndOperatorScrollView: UIScrollView!
    @IBOutlet private weak var operandAndOperatorStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        removeAlloperandAndOperatorStackViewSubviews()
    }
    
    @IBAction func numberZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            return
        }
        updateOperandLabel(with: "0")
    }
    
    @IBAction func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            return
        }
        updateOperandLabel(with: "00")
    }
    
    @IBAction func decimalPointButtonPressed(_ sender: UIButton) {
        
        guard let isContainingPoint = operandLabel.text?.contains(".") else { return }
        if isContainingPoint {
            return
        } else if operandLabel.text == "0" {
            updateOperandLabel(with: "0.")
        } else {
            updateOperandLabel(with: ".")
        }
    }
    
    @IBAction func numberOnePressed(_ sender: UIButton) {
        updateOperandLabel(with: "1")
    }
    
    @IBAction func numberTwoButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "2")
    }
    
    @IBAction func numberThreeButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "3")
    }
    
    @IBAction func numberFourButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "4")
    }
    
    @IBAction func numberFiveButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "5")
    }
    
    @IBAction func numberSixButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "6")
    }
    
    @IBAction func numberSevenButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "7")
    }
    
    @IBAction func numberEightButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "8")
    }
    
    @IBAction func numberNineButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "9")
    }
    
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "÷")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "÷")
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "×")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "×")
    }
    
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "−")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "−")
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "+")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "+")
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        
        if expression == "" {
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression()
        let result = fetchCalculatedResult()
        updateResult(result: result)
    }
    
    @IBAction func CEButtonPressed(_ sender: Any) {
        operandLabel.text = "0"
    }
    
    @IBAction func ACButtonPressed(_ sender: Any) {
        
        resetOperandLabel()
        resetOperatorLabel()
        resetExpression()
        removeAlloperandAndOperatorStackViewSubviews()
    }
    
    @IBAction func signChangeButtonPressed(_ sender: Any) {
        changeOperatorSign()
    }
    
    private func fetchCalculatedResult() -> String {
        
        var result = ""
        do {
            let unFormattedNumber = try ExpressionParser.parse(from: expression).result()
            result = fetchformattedNumbers(number: unFormattedNumber)
        } catch CalculatorError.dividedByZero {
            result = "NaN"
        } catch {
            print("알 수 없는 에러입니다.")
        }
        
        return result
    }
    
    private func fetchformattedNumbers(number: Double) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: number) else { return "" }
        return result
    }
    
    private func changeOperatorSign() {
        
        if operandLabel.text == "0" {
            return
        }
        guard let operandLabelText = operandLabel.text else { return }
        if operandLabelText.contains("-") {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = "-" + operandLabelText
        }
    }
    
    private func updateOperandLabel(with number: String) {
        
        if operandLabel.text == "0" {
            operandLabel.text = number
        } else {
            if let operandText = operandLabel.text {
                operandLabel.text = operandText + number
            }
        }
    }
    
    private func updateExpression(nextOperator: String = "") {
        
        guard let operand = operandLabel.text,
              let `operator` = operatorLabel.text else { return }
        expression += `operator`
        expression += operand
        resetOperandLabel()
        operatorLabel.text = nextOperator
    }
    
    private func updateOperandAndOperatorStackView() {
        
        guard let operandText = operandLabel.text,
              let operatorText = operatorLabel.text else { return }
        
        let textLabel = UILabel()
        textLabel.text = operatorText + " " + operandText
        textLabel.textColor = .white
        textLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        operandAndOperatorStackView.addArrangedSubview(textLabel)
        updateScrollViewToBottom()
    }
    
    private func updateResult(result: String) {
        
        operandLabel.text = result
        resetOperatorLabel()
        resetExpression()
    }
    
    private func updateScrollViewToBottom() {
        
        operandAndOperatorScrollView.layoutIfNeeded()
        operandAndOperatorScrollView.setContentOffset(
            CGPoint(x: 0,
                    y: operandAndOperatorScrollView.contentSize.height - operandAndOperatorScrollView.bounds.height),
                    animated: true)
    }
    
    private func removeAlloperandAndOperatorStackViewSubviews() {
        operandAndOperatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetExpression() {
        expression = ""
    }
}

