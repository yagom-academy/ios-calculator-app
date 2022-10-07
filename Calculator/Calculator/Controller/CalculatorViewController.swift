//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var finalCalculation = ""
    private var formula: Formula?
    
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBAction func acButton(_ sender: UIButton) {
        resetLabelText()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    @IBAction func ceButton(_ sender: UIButton) {
        operandLabel.text = ""
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains("-") {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = "-" + operandLabelText
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        updateFinalCalculation(userInput: operandLabel.text ?? "")
        
        resetLabelText()
        
        try? showResult()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    @IBAction func inputOperandButton(_ sender: UIButton) {
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
            pushOperator(finalCalculationInput: "/", operatorInput: "÷")
        case 92:
            pushOperator(finalCalculationInput: "*", operatorInput: "x")
        case 93:
            pushOperator(finalCalculationInput: "ㅡ", operatorInput: "-")
        case 94:
            pushOperator(finalCalculationInput: "+", operatorInput: "+")
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelText()
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
    private func pushOperand(_ userInput: String) {
        if let operandLabelText = operandLabel.text {
            operandLabel.text = operandLabelText + userInput
        }
    }
    
    private func pushOperator(finalCalculationInput: String, operatorInput: String) {
        updateFinalCalculation(userInput: operandLabel.text ?? "")
        
        if operandLabel.text == "" {
            changeOperator(replacement: finalCalculationInput)
        } else {
            updateFinalCalculation(userInput: finalCalculationInput)
        }
        
        operatorLabel.text = operatorInput
        operandLabel.text = ""
    }
    
    private func changeOperator(replacement: String) {
        guard finalCalculation.count != 0 else { return }
        
        finalCalculation.removeLast()
        updateFinalCalculation(userInput: replacement)
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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.001) {
            self.calculatorScrollView.setContentOffset(CGPoint(x: 0, y: self.calculatorScrollView.contentSize.height-self.calculatorScrollView.bounds.height), animated: true)
        }
    }
    
    private func updateFinalCalculation(userInput: String) {
        finalCalculation = finalCalculation + userInput
    }
    
    private func showResult() throws {
        print(finalCalculation)
        let calculation = ExpressionParser.parse(from: finalCalculation)
        formula = Formula(operands: calculation.operands, operators: calculation.operators)
        
        do {
            guard let calculatorResult = try formula?.result() else { return }
            operandLabel.text = String(calculatorResult)
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
}

