//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var calculationRecordScrollView: UIScrollView!
    @IBOutlet private weak var calculationRecordStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    // MARK: - Property
    private var currentOperand: String = ""
    private var expression = [String]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction
extension CalculatorViewController {
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetOperand()
    }
    
    @IBAction private func touchUpChangePlusMinusButton(_ sender: UIButton) {
        updatePlusMinusSign()
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        updateOperator(by: `operator`)
    }
    
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
        
        updateOperand(with: operand)
    }
        
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        updateOperand(by: dot)
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        
    }
}

// MARK: - Method
extension CalculatorViewController {
    private func updateOperand(with operand: String) {
        guard currentOperand.count < 20 else {
            return
        }
        
        currentOperand += operand
        operandLabel.text = currentOperand.addCommaEveryThirdTime()
    }
    
    private func updateOperand(by dot: String) {
        guard currentOperand.contains(dot) == false else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    private func updatePlusMinusSign() {
        guard operandLabel.text != "0",
              var operand = operandLabel.text else {
            return
        }
        
        if operand.contains("-") {
            operand.removeFirst()
            currentOperand.removeFirst()
            operandLabel.text = operand
            return
        }
        
        if operand.contains("-") == false {
            operand.insert("-", at: operand.startIndex)
            currentOperand.insert("-", at: operand.startIndex)
            operandLabel.text = operand
            return
        }
    }
    
    private func updateOperator(by operator: String) {
        guard operandLabel.text != "0" else {
            operatorLabel.text = `operator`
            return
        }
        
        expression.append(currentOperand)
        expression.append(`operator`)
        
        updateCalculationRecord(with: currentOperand, operator: `operator`)
        calculationRecordScrollView.scrollToBottom()
        
        operatorLabel.text = `operator`
        resetOperand()
    }
    
    private func updateCalculationRecord(with operand: String, operator: String) {
        if calculationRecordStackView.subviews.count == 0 {
            let ExpressionStackView = ExpressionStackView(operand: operand)
            calculationRecordStackView.addArrangedSubview(ExpressionStackView)
            return
        }

        let ExpressionStackView = ExpressionStackView(operator: `operator`, operand: operand)
        calculationRecordStackView.addArrangedSubview(ExpressionStackView)
    }
    
    private func resetOperand() {
        currentOperand = ""
        operandLabel.text = "0"
    }
}
