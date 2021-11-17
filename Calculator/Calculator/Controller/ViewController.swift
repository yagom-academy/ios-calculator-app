//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var calculationHistoryScrollView: UIScrollView!
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    private var finalExpression: String = ""
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    private var isCalculated: Bool = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCurrentOperand()
    }

    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
                        
        currentOperand += operand
                
        currentOperand = currentOperand.replacingOccurrences(of: "^0+", with: "0", options: .regularExpression)
        
        var integerDigits = currentOperand
        var fractionDigits = ""
        
        if currentOperand.contains(".") {
            let splited = currentOperand.split(with: ".")
            integerDigits = splited[0]
            fractionDigits = splited[1]
        }
        
        guard let operandText = integerDigits.addCommaOnEveryThreeDigits() else {
            return
        }
        
        operandLabel.text = fractionDigits.isEmpty ? operandText : operandText + "." + fractionDigits
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        guard !currentOperand.contains(dot) else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    @IBAction private func changePlusMinusSign(_ sender: Any) {
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            return
        }
        
        guard let operandText = String(currentNumber * -1).addCommaOnEveryThreeDigits() else {
            return
        }
        
        currentOperand = String(currentNumber * -1)
        operandLabel.text = operandText
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
    
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            operatorLabel.text = `operator`
            return
        }
        
        guard let operandText = String(currentNumber).addCommaOnEveryThreeDigits() else {
            return
        }
        
        addCalculationHistory(operandText: operandText, operatorText: currentOperator)
        
        finalExpression += currentOperand
        finalExpression += " \(`operator`) "
        
        resetCurrentOperand()
        
        currentOperator = `operator`
        operatorLabel.text = `operator`
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        guard !isCalculated else {
            return
        }
        
        isCalculated = true
        
        if !currentOperand.isEmpty && !currentOperator.isEmpty {
            addCalculationHistory(operandText: currentOperand, operatorText: currentOperator)
        }
        
        finalExpression += currentOperand
        print(finalExpression)
        let formula = ExpressionParser.parse(from: finalExpression)
        
        do {
            let calculationResult = try formula.result()
            guard let calculationResultText = calculationResult.description.addCommaOnEveryThreeDigits() else {
                return
            }
            
            resetCurrentOperand()
            operandLabel.text = calculationResultText
            operatorLabel.text = ""
        } catch OperationError.dividedByZero {
            resetCurrentOperand()
            operandLabel.text = "NaN"
            operatorLabel.text = ""
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
        operatorLabel.text = ""
        isCalculated = false
        
        resetCurrentOperand()
        
        calculationHistoryStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    private func resetCurrentOperand() {
        currentOperand = ""
        operandLabel.text = "0"
    }

    @IBAction private func touchUpCEButton(_ sender: Any) {
        guard !isCalculated else {
            resetToInitialState()
            return
        }
        
        resetCurrentOperand()
    }
    
    private func addCalculationHistory(operandText: String, operatorText: String) {
        let sign = UILabel()
        sign.textColor = .white
        sign.text = operatorText
        sign.font = UIFont(name: "Helvetica", size: 24)
        
        let history = UILabel()
        history.text = operandText
        history.textColor = .white
        history.font = UIFont(name: "Helvetica", size: 24)
        
        let newHistoryStackView = UIStackView(arrangedSubviews: [sign, history])
        
        newHistoryStackView.axis = .horizontal
        newHistoryStackView.spacing = 10
        
        calculationHistoryStackView.addArrangedSubview(newHistoryStackView)
        
        autoScrollToBottom()
    }
    
    private func autoScrollToBottom() {
        calculationHistoryScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: calculationHistoryScrollView.contentSize.height - calculationHistoryScrollView.bounds.height + calculationHistoryScrollView.contentInset.bottom)
        
        if bottomOffset.y > 0 {
            calculationHistoryScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
}

