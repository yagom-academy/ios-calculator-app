//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var finalCalculation = NameSpace.emptyString
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
        if operandLabel.text != NameSpace.emptyString {
            updateCalculatorStackView()
        }
        
        switch sender.tag {
        case 91:
            pushOperator(operatorInput: Operator.divide, operatorLabelTextInput: NameSpace.divideText)
        case 92:
            pushOperator(operatorInput: Operator.multiply, operatorLabelTextInput: NameSpace.multiplyText)
        case 93:
            pushOperator(operatorInput: Operator.subtract, operatorLabelTextInput: NameSpace.subtractText)
        case 94:
            pushOperator(operatorInput: Operator.add, operatorLabelTextInput: NameSpace.addText)
        default:
            break
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        updateFinalCalculation(userInput: operandLabel.text ?? NameSpace.emptyString)
        
        resetLabelText()
        try? showResult()
        resetCalculation()
        resetCalculatorStackView()
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains(NameSpace.subtractText) {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = NameSpace.subtractText + operandLabelText
        }
    }
    
    @IBAction func ceButton(_ sender: UIButton) {
        operandLabel.text = NameSpace.emptyString
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
    
    private func pushOperator(operatorInput: Operator, operatorLabelTextInput: String) {
        let operatorString = String(operatorInput.rawValue)
        updateFinalCalculation(userInput: operandLabel.text ?? NameSpace.emptyString)
        
        if operandLabel.text == NameSpace.emptyString {
            changeOperator(replacement: operatorString)
        } else {
            updateFinalCalculation(userInput: operatorString)
        }
        
        operatorLabel.text = operatorLabelTextInput
        operandLabel.text = NameSpace.emptyString
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
        
        calculatorLabel.text = (operatorLabel.text ?? NameSpace.emptyString) + NameSpace.whiteSpace + (operandLabel.text ?? NameSpace.emptyString)
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
        operatorLabel.text = NameSpace.error
        
        resetCalculation()
        resetCalculatorStackView()
    }
    
    private func resetLabelText() {
        operandLabel.text = NameSpace.emptyString
        operatorLabel.text = NameSpace.emptyString
    }
    
    private func resetCalculation() {
        finalCalculation = NameSpace.emptyString
    }
    
    private func resetCalculatorStackView() {
        calculatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
}

