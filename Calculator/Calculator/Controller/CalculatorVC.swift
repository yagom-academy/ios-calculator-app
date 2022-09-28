//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {
    
    var finalFormula: String = ""
    var currentNumber: String = ""
    
    @IBOutlet private weak var calculationFormulaScroll: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.subviews.forEach { $0.removeFromSuperview()
        }
        operatorLabel.text = ""
        operandLabel.text = "0"
        currentNumber = ""
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text?.first == "0" {
            operandLabel.text?.removeFirst()
        }
        currentNumber.append(sender.titleLabel?.text ?? "")
        operandLabel.text = currentNumber
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") {
            return
        } else if operandLabel.text == "0" {
            currentNumber = "0."
        } else {
            currentNumber.append(sender.titleLabel?.text ?? "")
        }
        operandLabel.text = currentNumber
    }
    
    @IBAction private func touchUpAcButton(_ sender: UIButton) {
        resetAllUI()
    }
    
    @IBAction private func touchUpCeButton(_ sender: UIButton) {
        currentNumber = ""
        operandLabel.text = "0"
    }
    
    @IBAction private func touchUpConvertPlusMinusButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else if currentNumber.first == "-" {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = "-\(currentNumber)"
        }
        operandLabel.text = currentNumber
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else {
            operatorLabel.text = sender.titleLabel?.text
            makeFormulaStackView()
            scrollToBottom()
            if finalFormula.isEmpty {
                finalFormula.append(currentNumber)
            } else {
                finalFormula.append(operatorLabel.text ?? "")
                finalFormula.append(currentNumber)
            }
            operandLabel.text = "0"
        }
    }
    
    private func makeFormulaStackView() {
        guard let operatorLabel = makeOperatorLabel(),
              let operandLabel = makeOperandLabel() else {
            return
        }
        
        let formulaStackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        
        formulaStackView.spacing = 8
        mainStackView.addArrangedSubview(formulaStackView)
        currentNumber = ""
    }
    
    private func makeOperatorLabel() -> UILabel? {
        let operatorLabelForStack: UILabel = UILabel()
        operatorLabelForStack.text = operatorLabel.text
        operatorLabelForStack.textColor = .white
        return operatorLabelForStack
    }
    
    private func makeOperandLabel() -> UILabel? {
        let operandLabelForStack: UILabel = UILabel()
        operandLabelForStack.text = operandLabel.text
        operandLabelForStack.textColor = .white
        return operandLabelForStack
    }
    
    private func scrollToBottom() {
        calculationFormulaScroll.setContentOffset(
            CGPoint(x: 0,
                    y: calculationFormulaScroll.contentSize.height - calculationFormulaScroll.bounds.height),
            animated: true)
    }
    
}
