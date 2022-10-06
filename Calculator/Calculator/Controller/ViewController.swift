//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var stackCalculation = ""
    private var finalCalculation = ""
    private var checkSign = ""
    private var formula: Formula?
    
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBAction func acButton(_ sender: UIButton) {
        resetLabelText()
        resetCalculation()
    }
    
    @IBAction func ceButton(_ sender: UIButton) {
        stackCalculation = ""
        operandLabel.text = ""
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains(Operator.subtract.rawValue) {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
            changeSignFinalCalculation(from: "+", to: "-")
        } else {
            operandLabel.text = "-" + operandLabelText
            changeSignFinalCalculation(from: "-", to: "+")
        }
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        pushOperator(finalCalculationInput: "/", operatorInput: "÷")
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        pushOperator(finalCalculationInput: "*", operatorInput: "x")
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        pushOperator(finalCalculationInput: "-", operatorInput: "-")
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        pushOperator(finalCalculationInput: "+", operatorInput: "+")
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        updateCalculatorStackView()
        operatorLabel.text = ""
        operandLabel.text = ""
        stackCalculation = ""
        
        try? showResult()
    }
    
    @IBAction func inputNumberButton(_ sender: UIButton) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelText()
        resetCalculation()
        // Do any additional setup after loading the view.
    }
    
    private func resetLabelText() {
        operandLabel.text = ""
        operatorLabel.text = ""
    }
    
    private func resetCalculation() {
        stackCalculation = ""
        finalCalculation = ""
        calculatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    private func pushOperand(_ userInput: String) {
        stackCalculation = stackCalculation + userInput
        finalCalculation = finalCalculation + userInput
        operandLabel.text = stackCalculation
    }
    
    private func pushOperator(finalCalculationInput: String, operatorInput: String) {
        finalCalculation = finalCalculation + finalCalculationInput
        stackCalculation = ""
        operatorLabel.text = operatorInput
        operandLabel.text = ""
    }
    
    private func changeSignFinalCalculation(from target: String, to replacement: String) {
        if finalCalculation.count == 0 {
            return
        }
        
        var finalCalculationList = Array(finalCalculation).map { String($0) }
        
        for count in (0...finalCalculationList.count-1).reversed() {
            if finalCalculationList[count] == target {
                finalCalculationList[count] = replacement
                finalCalculation = finalCalculationList.joined()
                return
            } else if finalCalculationList[count] == replacement {
                finalCalculationList[count] = target
                finalCalculation = finalCalculationList.joined()
                return
            }
        }
    }
    
    private func updateCalculatorStackView() {
        let calculatorLabel = UILabel()
        let whiteSpace = " "
        
        calculatorLabel.text = (operatorLabel.text ?? "") + whiteSpace + (operandLabel.text ?? "")
        calculatorLabel.textColor = .white
        calculatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        calculatorStackView.addArrangedSubview(calculatorLabel)
        updateCalculatorScrollView()
    }
    
    private func updateCalculatorScrollView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.001) {
            self.calculatorScrollView.scrollRectToVisible(CGRectMake(0, self.calculatorScrollView.contentSize.height-self.calculatorScrollView.bounds.height, self.calculatorScrollView.bounds.size.width, self.calculatorScrollView.bounds.size.height),
                                                          animated: true)
        }
    }
    
    private func showResult() throws {
        let calculation = ExpressionParser.parse(from: finalCalculation)
        formula = Formula(operands: calculation.operands, operators: calculation.operators)
        
        do {
            let result = try formula?.result()
            guard let calculatorResult = result else { return }
            
            operandLabel.text = String(calculatorResult)
            resetCalculation()
        } catch CalculateError.invalidNumber {
            showErrorMessage(CalculateError.invalidNumber)
        } catch CalculateError.emptyOperands {
            showErrorMessage(CalculateError.emptyOperands)
        } catch CalculateError.emptyOperators {
            showErrorMessage(CalculateError.emptyOperators)
        }
    }
    
    func showErrorMessage(_ errorType: CalculateError) {
        operandLabel.text = errorType.rawValue
        operatorLabel.text = "Error"
        resetCalculation()
    }
}

