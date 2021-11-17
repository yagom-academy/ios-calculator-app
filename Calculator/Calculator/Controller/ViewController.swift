//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var calculationHistoryScrollView: UIScrollView!
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var expression: UILabel!
    @IBOutlet private weak var arithmetic: UILabel!
    
    private var finalExpression: String = ""
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    private var isCalculated: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expression.text = "0"
    }

    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
                
        guard operand != "." || !currentOperand.contains(".") else {
            return
        }
        
        if operand == "." {
            currentOperand += currentOperand.isEmpty ? "0." : "."
            expression.text = currentOperand
            return
        } else {
            currentOperand += operand
        }
                
        currentOperand = currentOperand.replacingOccurrences(of: "^0+", with: "0", options: .regularExpression)
        
        guard let operandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        expression.text = operandText
    }
    
    @IBAction private func changePlusMinusSign(_ sender: Any) {
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            return
        }
        
        guard let operandText = String(currentNumber * -1).addCommaOnEveryThreeDigits() else {
            return
        }
        
        currentOperand = String(currentNumber * -1)
        expression.text = operandText
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
    
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            arithmetic.text = `operator`
            return
        }
        
        guard let operandText = String(currentNumber).addCommaOnEveryThreeDigits() else {
            return
        }
        
        addCalculationHistory(operandsText: operandText, operatorText: currentOperator)
        
        finalExpression += currentOperand
        finalExpression += " \(`operator`) "
        
        resetCurrentOperand()
        
        currentOperator = `operator`
        arithmetic.text = `operator`
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        guard !isCalculated else {
            return
        }
        
        isCalculated = true
        
        if !currentOperand.isEmpty && !currentOperator.isEmpty {
            addCalculationHistory(operandsText: currentOperand, operatorText: currentOperator)
        }
        
        finalExpression += currentOperand
        
        let formula = ExpressionParser.parse(from: finalExpression)
        
        do {
            let calculationResult = try formula.result()
            guard let calculationResultText = calculationResult.description.addCommaOnEveryThreeDigits() else {
                return
            }
            
            resetCurrentOperand()
            expression.text = calculationResultText
            arithmetic.text = ""
        } catch OperationError.dividedByZero {
            resetCurrentOperand()
            expression.text = "NaN"
            arithmetic.text = ""
        } catch CalculationItemQueueError.hasNoElement {
            print(CalculationItemQueueError.hasNoElement.localizedDescription)
        } catch {
            print(error)
        }
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        resetToInitialState()
    }
    
    private func resetToInitialState() {
        finalExpression = ""
        currentOperator = ""
        arithmetic.text = ""
        isCalculated = false
        
        resetCurrentOperand()
        
        calculationHistoryStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    private func resetCurrentOperand() {
        currentOperand = ""
        expression.text = "0"
    }

    @IBAction private func touchUpCEButton(_ sender: Any) {
        guard !isCalculated else {
            resetToInitialState()
            return
        }
        
        resetCurrentOperand()
    }
    
    private func addCalculationHistory(operandsText: String, operatorText: String) {
        let sign = UILabel()
        sign.textColor = .white
        sign.text = operatorText
        sign.font = UIFont(name: "Helvetica", size: 24)
        
        let history = UILabel()
        history.text = operandsText
        history.textColor = .white
        history.font = UIFont(name: "Helvetica", size: 24)
        
        let newHistoryStackView = UIStackView(arrangedSubviews: [sign, history])
        
        newHistoryStackView.axis = .horizontal
        newHistoryStackView.spacing = 10
        
        calculationHistoryStackView.addArrangedSubview(newHistoryStackView)
        
        newHistoryStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newHistoryStackView.trailingAnchor.constraint(equalTo: calculationHistoryStackView.trailingAnchor, constant: 10.0)
        ])
        
        autoScrollToBottom()
    }
    
    private func autoScrollToBottom() {
        UIView.animate(withDuration: 0.1) {
        self.calculationHistoryScrollView.contentOffset = CGPoint(x: 0, y: self.calculationHistoryScrollView.frame.origin.y * 100)
        }
    }
}

