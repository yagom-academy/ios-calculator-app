//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var expression: String = ""
    
    @IBOutlet weak var operandAndOperatorScrollView: UIScrollView!
    @IBOutlet weak var operandAndOperatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "÷")
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "×")
    }
    
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "-")
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        updateOperandAndOperatorStackView()
        updateExpression(nextOperator: "+")
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        updateExpression()
        let result = ExpressionParser.parse(from: expression).result()
        updateResult(result: result)
        updateOperandAndOperatorStackView()
    }
    
    func updateOperandLabel(with number: String) {
        if operandLabel.text == "0" {
            operandLabel.text = number
        } else {
            if let operandText = operandLabel.text {
                operandLabel.text = operandText + number
            }
        }
    }
    
    func updateExpression(nextOperator: String = "") {
        guard let operand = operandLabel.text,
              let `operator` = operatorLabel.text else { return }
        expression += `operator`
        expression += operand
        operandLabel.text = "0"
        operatorLabel.text = nextOperator
    }
    
    func updateOperandAndOperatorStackView() {
        guard let operandText = operandLabel.text,
              let operatorText = operatorLabel.text else { return }
        
        let textLabel = UILabel()
        textLabel.text = operatorText + " " + operandText
        textLabel.textColor = .white
        textLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        operandAndOperatorStackView.addArrangedSubview(textLabel)
        updateScrollViewToBottom()
    }
    
    func updateResult(result: Double) {
        operandLabel.text = result.description
        operatorLabel.text = ""
        expression = ""
    }
    
    func updateScrollViewToBottom() {
        operandAndOperatorScrollView.layoutIfNeeded()
        operandAndOperatorScrollView.setContentOffset(CGPoint(x: 0,
                                            y: operandAndOperatorScrollView.contentSize.height - operandAndOperatorScrollView.bounds.height),
                                    animated: true)
    }
}

