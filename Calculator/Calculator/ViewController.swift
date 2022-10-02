//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private enum Constant {
        static let one = "1"
        static let two = "2"
        static let three = "3"
        static let four = "4"
        static let five = "5"
        static let six = "6"
        static let seven = "7"
        static let eight = "8"
        static let nine = "9"
        static let add = "+"
        static let substract = "−"
        static let multiply = "×"
        static let divide = "÷"
        static let minus = "-"
        static let doubleZero = "00"
        static let dot = "."
        static let zero = "0"
    }
    
    private var expression: String = ""
    let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet private weak var operandAndOperatorScrollView: UIScrollView!
    @IBOutlet private weak var operandAndOperatorStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        removeAlloperandAndOperatorStackViewSubviews()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction private func numberZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == Constant.zero {
            return
        }
        updateOperandLabel(with: Constant.zero)
    }
    
    @IBAction private func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == Constant.zero {
            return
        }
        updateOperandLabel(with: Constant.doubleZero)
    }
    
    @IBAction private func decimalPointButtonPressed(_ sender: UIButton) {
        
        guard let isContainingPoint = operandLabel.text?.contains(Constant.dot) else { return }
        if isContainingPoint {
            return
        } else if operandLabel.text == Constant.zero {
            updateOperandLabel(with: "0.")
        } else {
            updateOperandLabel(with: Constant.dot)
        }
    }
    
    @IBAction private func numberOnePressed(_ sender: UIButton) {
        updateOperandLabel(with: "1")
    }
    
    @IBAction private func numberTwoButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "2")
    }
    
    @IBAction private func numberThreeButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "3")
    }
    
    @IBAction private func numberFourButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "4")
    }
    
    @IBAction private func numberFiveButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "5")
    }
    
    @IBAction private func numberSixButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "6")
    }
    
    @IBAction private func numberSevenButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "7")
    }
    
    @IBAction private func numberEightButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "8")
    }
    
    @IBAction private func numberNineButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: "9")
    }
    
    @IBAction private func divideButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "÷")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "÷")
    }
    
    @IBAction private func multiplyButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "×")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "×")
    }
    
    @IBAction private func subtractButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "−")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "−")
    }
    
    @IBAction private func addButtonPressed(_ sender: UIButton) {
        
        if operandLabel.text == "0" {
            updateExpression(nextOperator: "+")
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "+")
    }
    
    @IBAction private func resultButtonPressed(_ sender: UIButton) {
        
        if expression == "" {
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression()
        let result = fetchCalculatedResult()
        updateResult(result: result)
    }
    
    @IBAction private func CEButtonPressed(_ sender: Any) {
        operandLabel.text = "0"
    }
    
    @IBAction private func ACButtonPressed(_ sender: Any) {
        
        resetOperandLabel()
        resetOperatorLabel()
        resetExpression()
        removeAlloperandAndOperatorStackViewSubviews()
    }
    
    @IBAction private func signChangeButtonPressed(_ sender: Any) {
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

