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
        
        finalCalculation = finalCalculation + "/"
        stackCalculation = ""
        operatorLabel.text = "÷"
        operandLabel.text = ""
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        finalCalculation = finalCalculation + "*"
        stackCalculation = ""
        operatorLabel.text = "x"
        operandLabel.text = ""
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        if checkSign.contains("-") {
            finalCalculation = finalCalculation + "+"
            stackCalculation = ""
            operatorLabel.text = "-"
            operandLabel.text = ""
        } else {
            finalCalculation = finalCalculation + "-"
            stackCalculation = ""
            operatorLabel.text = "-"
            operandLabel.text = ""
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if operandLabel.text != "" {
            updateCalculatorStackView()
        }
        
        if checkSign.contains("-") {
            finalCalculation = finalCalculation + "-"
            stackCalculation = ""
            operatorLabel.text = "+"
            operandLabel.text = ""
        } else {
            finalCalculation = finalCalculation + "+"
            stackCalculation = ""
            operatorLabel.text = "+"
            operandLabel.text = ""
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
        pushInput(".")
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        pushInput("0")
    }
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {
        pushInput("00")
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        pushInput("1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        pushInput("2")
    }
    
    @IBAction func threeCButton(_ sender: UIButton) {
        pushInput("3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        pushInput("4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        pushInput("5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        pushInput("6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        pushInput("7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        pushInput("8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        pushInput("9")
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
    
    private func pushInput(_ userInput: String) {
        stackCalculation = stackCalculation + userInput
        finalCalculation = finalCalculation + userInput
        operandLabel.text = stackCalculation
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
        print(calculation.operands, calculation.operators)
        
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

