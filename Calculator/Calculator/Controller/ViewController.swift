//
//  Calculator - ViewController.swift
//  Created by dragon. 
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
        resetCalculator(operandText: "", operatorText: "")
    }
    
    @IBAction func ceButton(_ sender: UIButton) {
        stackCalculation = ""
        operandLabel.text = ""
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains("-") {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
            checkSign = operandLabel.text ?? ""
        } else {
            operandLabel.text = "-" + operandLabelText
            checkSign = operandLabel.text ?? ""
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
        
        if checkSign.contains("-") {
            pushOperator(finalCalculationInput: "+", operatorInput: "-")
        } else {
            pushOperator(finalCalculationInput: "-", operatorInput: "-")
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        if checkSign.contains("-") {
            pushOperator(finalCalculationInput: "-", operatorInput: "+")
        } else {
            pushOperator(finalCalculationInput: "+", operatorInput: "+")
        }
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
        resetCalculator(operandText: "", operatorText: "")
        // Do any additional setup after loading the view.
    }
    
    private func resetCalculator(operandText: String, operatorText: String) {
        operandLabel.text = operandText
        operatorLabel.text = operatorText
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
    
    private func updateCalculatorStackView() {
        let calculatorLabel = UILabel()
        let whiteSpace = " "
        calculatorLabel.text = (operatorLabel.text ?? "") + whiteSpace + (operandLabel.text ?? "")
        calculatorLabel.textColor = .white
        calculatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        calculatorStackView.addArrangedSubview(calculatorLabel)
    }
    
    private func showResult() throws {
        let calculation = ExpressionParser.parse(from: finalCalculation)
        formula = Formula(operands: calculation.operands, operators: calculation.operators)
        
        do {
            let result = try formula?.result()
            guard let calculatorResult = result else { return }
            
            operandLabel.text = String(calculatorResult)
            stackCalculation = String(calculatorResult)
        } catch CalculatorError.invalidNumber {
            resetCalculator(operandText: "invalid Number", operatorText: "Error")
        }
    }
}

