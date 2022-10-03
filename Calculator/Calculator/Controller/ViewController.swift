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
        resetCalculator()
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
    
    @IBAction func pointButton(_ sender: UIButton) {
        pushOperand(".")
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        pushOperand("0")
    }
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {
        pushOperand("00")
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        pushOperand("1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        pushOperand("2")
    }
    
    @IBAction func threeCButton(_ sender: UIButton) {
        pushOperand("3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        pushOperand("4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        pushOperand("5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        pushOperand("6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        pushOperand("7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        pushOperand("8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        pushOperand("9")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
        // Do any additional setup after loading the view.
    }
    
    private func resetCalculator() {
        operandLabel.text = ""
        operatorLabel.text = ""
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
        calculatorLabel.text = (operatorLabel.text ?? "") + " " + (operandLabel.text ?? "")
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
            operandLabel.text = "invalid Number"
            stackCalculation = ""
            finalCalculation = ""
            calculatorStackView.subviews.forEach { (view) in
                view.removeFromSuperview()
            }
        }
    }
}

