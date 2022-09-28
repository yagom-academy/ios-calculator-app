//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {
    
    private var totalFormulaString: String = ""
    private var currentNumber: String = ""
    
    @IBOutlet private weak var calculationFormulaScroll: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.subviews.forEach { $0.removeFromSuperview()
        }
        operatorLabel.text = ""
        operandLabel.text = "0"
        currentNumber = ""
        totalFormulaString = ""
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text?.first == "0" {
            operandLabel.text?.removeFirst()
        }
        currentNumber.append(sender.titleLabel?.text ?? "")
        operandLabel.text = currentNumber
        operandLabel.text = numberFormatter(number: currentNumber)
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") {
            return
        } else if operandLabel.text == "0" {
            currentNumber = "0."
        } else {
            currentNumber.append(sender.titleLabel?.text ?? "")
        }
        
        if currentNumber.last == "." {
            operandLabel.text = "\(numberFormatter(number: currentNumber))."
        } else {
            operandLabel.text = numberFormatter(number: currentNumber)
        }
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
            operatorLabel.text = sender.titleLabel?.text
        } else {
            makeFormulaStackView()
            scrollToBottom()
            if totalFormulaString.isEmpty {
                totalFormulaString.append(currentNumber)
            } else {
                totalFormulaString.append(operatorLabel.text ?? "")
                totalFormulaString.append(currentNumber)
            }
            
            operatorLabel.text = sender.titleLabel?.text
            currentNumber = ""
            operandLabel.text = "0"
        }
    }
    
    private func makeFormulaStackView() {
        let operatorLabel = makeOperatorLabel()
        let operandLabel = makeOperandLabel()
        let formulaStackView: UIStackView
        
        if totalFormulaString.isEmpty {
            formulaStackView = UIStackView(arrangedSubviews: [operandLabel])
        } else {
            formulaStackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        }
        formulaStackView.spacing = 8
        mainStackView.addArrangedSubview(formulaStackView)
    }
    
    private func makeOperatorLabel() -> UILabel {
        let operatorLabelForStack: UILabel = UILabel()
        operatorLabelForStack.text = operatorLabel.text
        operatorLabelForStack.textColor = .white
        return operatorLabelForStack
    }
    
    private func makeOperandLabel() -> UILabel {
        let operandLabelForStack: UILabel = UILabel()
        operandLabelForStack.text = operandLabel.text
        operandLabelForStack.textColor = .white
        return operandLabelForStack
    }
    
    private func scrollToBottom() {
        view.layoutIfNeeded()
        calculationFormulaScroll.setContentOffset(
            CGPoint(x: 0,
                    y: calculationFormulaScroll.contentSize.height - calculationFormulaScroll.bounds.height),
            animated: true)
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        //        if !totalFormulaString.isEmpty {
        //            totalFormulaString += operatorLabel.text ?? ""
        //            totalFormulaString += operandLabel.text ?? ""
        //            makeFormulaStackView()
        //            scrollToBottom()
        //            var formula = ExpressionParser.parse(from: totalFormulaString)
        //            let result = formula.result()
        //            if result == Double.infinity {
        //                operandLabel.text = "NaN"
        //            } else {
        //                operandLabel.text = String(result)
        //            }
        
        makeFormulaStackView()
        scrollToBottom()
        operandLabel.text = currentNumber
        //}
    }
    
    private func numberFormatter(number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 10
        guard let decimalNumber = Double(number) else {
            return number
        }
        return numberFormatter.string(from: NSNumber(value: decimalNumber))!
    }
    
}
