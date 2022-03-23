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
    private var currentOperator: String = ""
    private var expression = [String]()
    private var isCalculated = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction
extension CalculatorViewController {
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        reconfigureCalculator()
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        reconfigureOperand()
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
        guard isCalculated == false else {
            return
        }
        
        updateLastCalculation()
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
        
        updateCalculationRecord(with: currentOperand, currentOperator)
        calculationRecordScrollView.scrollToBottom()
        
        currentOperator = `operator`
        operatorLabel.text = `operator`
        reconfigureOperand()
    }
    
    private func updateCalculationRecord(with operand: String, _ operator: String) {
        if calculationRecordStackView.subviews.count == 0 {
            let ExpressionStackView = ExpressionStackView(operand: operand)
            calculationRecordStackView.addArrangedSubview(ExpressionStackView)
            return
        }

        let ExpressionStackView = ExpressionStackView(operator: `operator`, operand: operand)
        calculationRecordStackView.addArrangedSubview(ExpressionStackView)
    }
    
    private func updateLastCalculation() {
        expression.append(currentOperand)
        updateCalculationRecord(with: currentOperand, currentOperator)
        
        calculate()
    }
    
    private func calculate() {
        var formula = ExpressionParser.parse(from: expression.joined(separator: " "))
        
        do {
            let result = try formula.result()
            updateCalculateResult(by: result)
        } catch {
            
        }
    }
    
    private func updateCalculateResult(by result: Double) {
        isCalculated = true
        operandLabel.text = result.description.addCommaEveryThirdTime()
        reconfigureOperator()
    }
    
    private func reconfigureCalculator() {
        isCalculated = false
        expression = [String]()
        reconfigureOperand()
        reconfigureOperator()
        calculationRecordStackView
            .arrangedSubviews
            .forEach { $0.removeFromSuperview() }
    }
    
    private func reconfigureOperand() {
        currentOperand = ""
        operandLabel.text = "0"
    }
    
    private func reconfigureOperator() {
        currentOperator = ""
        operatorLabel.text = ""
    }
}
