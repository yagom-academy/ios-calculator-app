//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
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
        static let subtract = "−"
        static let multiply = "×"
        static let divide = "÷"
        static let minus = "-"
        static let doubleZero = "00"
        static let dot = "."
        static let zero = "0"
    }
    
    private var expression: String = ""
    let numberFormatter: NumberFormatter = NumberFormatter()
    private var isZero: Bool {
        operandLabel.text == Constant.zero
    }
    
    @IBOutlet private weak var operandAndOperatorScrollView: UIScrollView!
    @IBOutlet private weak var operandAndOperatorStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        resetSubviewsIfNeeded()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction private func numberZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            return
        }
        updateOperandLabel(with: Constant.zero)
    }
    
    @IBAction private func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            return
        }
        updateOperandLabel(with: Constant.doubleZero)
    }
    
    @IBAction private func decimalPointButtonPressed(_ sender: UIButton) {
        
        guard let isContainingPoint = operandLabel.text?.contains(Constant.dot) else { return }
        if isContainingPoint {
            return
        } else if operandLabel.isZero {
            updateOperandLabel(with: "0.")
        } else {
            updateOperandLabel(with: Constant.dot)
        }
    }
    
    @IBAction private func numberOnePressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.one)
    }
    
    @IBAction private func numberTwoButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.two)
    }
    
    @IBAction private func numberThreeButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.three)
    }
    
    @IBAction private func numberFourButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.four)
    }
    
    @IBAction private func numberFiveButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.five)
    }
    
    @IBAction private func numberSixButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.six)
    }
    
    @IBAction private func numberSevenButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.seven)
    }
    
    @IBAction private func numberEightButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.eight)
    }
    
    @IBAction private func numberNineButtonPressed(_ sender: UIButton) {
        updateOperandLabel(with: Constant.nine)
    }
    
    @IBAction private func divideButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            updateOpratorLabel(with: Constant.divide)
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: Constant.divide)
    }
    
    @IBAction private func multiplyButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            updateOpratorLabel(with: Constant.multiply)
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: Constant.multiply)
    }
    
    @IBAction private func subtractButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            updateOpratorLabel(with: Constant.subtract)
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: Constant.subtract)
    }
    
    @IBAction private func addButtonPressed(_ sender: UIButton) {
        
        if operandLabel.isZero {
            updateOpratorLabel(with: Constant.add)
            return
        }
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: Constant.add)
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
        operandLabel.text = Constant.zero
    }
    
    @IBAction private func ACButtonPressed(_ sender: Any) {
        
        resetOperandLabel()
        resetOperatorLabel()
        resetExpression()
        resetSubviewsIfNeeded()
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
        
        if operandLabel.isZero {
            return
        }
        guard let operandLabelText = operandLabel.text else { return }
        if operandLabelText.contains(Constant.minus) {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = Constant.minus + operandLabelText
        }
    }
    
    private func updateOperandLabel(with number: String) {
        
        if operandLabel.isZero {
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
    
    private func resetSubviewsIfNeeded() {
        operandAndOperatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    private func resetOperandLabel() {
        operandLabel.text = Constant.zero
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetExpression() {
        expression = ""
    }
    
    private func updateOpratorLabel(with `operator`: String) {
        operandLabel.text = `operator`
    }
}

