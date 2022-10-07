//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var finalCalculation = ""
    private var isCalculateEnd: Bool = false
    
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelText()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    @IBAction func inputOperandButton(_ sender: UIButton) {
        if isCalculateEnd == true {
            resetLabelText()
            isCalculateEnd = false
        }
        
        switch sender.tag {
        case -1:
            pushOperand(".")
        case 0, 1, 2, 3, 4, 5, 6 ,7, 8, 9:
            pushOperand("\(sender.tag)")
        case 10:
            pushOperand("00")
        default:
            break
        }
    }
    
    @IBAction func inputOperatorButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        switch sender.tag {
        case 91:
            pushOperator(operatorInput: "/", operatorLabelTextInput: "÷")
        case 92:
            pushOperator(operatorInput: "*", operatorLabelTextInput: "x")
        case 93:
            pushOperator(operatorInput: "−", operatorLabelTextInput: "-")
        case 94:
            pushOperator(operatorInput: "+", operatorLabelTextInput: "+")
        default:
            break
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        updateFinalCalculation(userInput: operandLabel.text ?? "")
        
        resetLabelText()
        try? showResult()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains("-") {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = "-" + operandLabelText
        }
    }
    
    @IBAction func ceButton(_ sender: UIButton) {
        operandLabel.text = ""
    }
    
    @IBAction func acButton(_ sender: UIButton) {
        resetLabelText()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    private func pushOperand(_ userInput: String) {
        if let operandLabelText = operandLabel.text {
            operandLabel.text = operandLabelText + userInput
        }
    }
    
    private func pushOperator(operatorInput: String, operatorLabelTextInput: String) {
        updateFinalCalculation(userInput: operandLabel.text ?? "")
        
        if operandLabel.text == "" {
            changeOperator(replacement: operatorInput)
        } else {
            updateFinalCalculation(userInput: operatorInput)
        }
        
        operatorLabel.text = operatorLabelTextInput
        operandLabel.text = ""
    }
    
    private func changeOperator(replacement: String) {
        guard finalCalculation.count != 0 else { return }
        
        finalCalculation.removeLast()
        updateFinalCalculation(userInput: replacement)
    }
    
    private func updateFinalCalculation(userInput: String) {
        finalCalculation = finalCalculation + userInput
    }
    
    private func updateCalculatorStackView() {
        let calculatorLabel = UILabel()
        let whiteSpace = " "
        
        calculatorLabel.text = (operatorLabel.text ?? "") + whiteSpace + (operandLabel.text ?? "")
        calculatorLabel.textColor = .white
        calculatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        calculatorStackView.addArrangedSubview(calculatorLabel)
        scrollToCalculatorScrollViewBottom()
    }
    
    private func scrollToCalculatorScrollViewBottom() {
        calculatorScrollView.layoutIfNeeded()
        calculatorScrollView.setContentOffset(CGPoint(x: 0, y: calculatorScrollView.contentSize.height - calculatorScrollView.bounds.height), animated: true)
    }
    
    private func showResult() throws {
        let calculation = ExpressionParser.parse(from: finalCalculation)
        var formula = Formula(operands: calculation.operands, operators: calculation.operators)
        
        do {
            operandLabel.text = String(try formula.result())
            isCalculateEnd = true
        } catch CalculateError.invalidNumber {
            showErrorMessage(CalculateError.invalidNumber)
        } catch CalculateError.emptyOperands {
            showErrorMessage(CalculateError.emptyOperands)
        } catch CalculateError.emptyOperators {
            showErrorMessage(CalculateError.emptyOperators)
        }
    }
    
    private func showErrorMessage(_ errorType: CalculateError) {
        operandLabel.text = errorType.rawValue
        operatorLabel.text = "Error"
        
        resetCalculation()
        resetCalculatorStackView()
    }
    
    private func resetLabelText() {
        operandLabel.text = ""
        operatorLabel.text = ""
    }
    
    private func resetCalculation() {
        finalCalculation = ""
    }
    
    private func resetCalculatorStackView() {
        calculatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
}

