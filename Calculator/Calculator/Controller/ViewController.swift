//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    //MARK: - Properties
    
    private var formulaString = String()
    private var currentOperand: String {
        guard let operand = operandLabel.text else {
            return ""
        }
        return operand
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let newDigit = sender.currentTitle else {
            return
        }
        if currentOperand == "0" {
            updateOperandLabel(with: newDigit)
        } else {
            updateOperandLabel(with: currentOperand + newDigit)
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let newOperator = sender.currentTitle,
              let currentOperator = operatorLabel.text else {
            return
        }
        if operatorLabel.text == "" {
            configureFormulaStackView(operand: currentOperand, operator: "")
        } else {
            configureFormulaStackView(operand: currentOperand, operator: currentOperator)
        }
        operatorLabel.text = newOperator
        formulaString += currentOperand + newOperator
        updateOperandLabel(with: "0")
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        if currentOperand.hasPrefix("-") {
            operandLabel.text = operandLabel.text?.replacingOccurrences(of: "-", with: "")
        } else {
            operandLabel.text = "-" + currentOperand
        }
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        if currentOperand != "0" {
            operandLabel.text?.removeLast()
        }
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        formulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        formulaString = ""
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        if currentOperand.contains(".") {
            return
        }
        updateOperandLabel(with: currentOperand + ".")
    }
    
    @IBAction func euqualButtonTapped(_ sender: UIButton) {
        guard let currentOperator = operatorLabel.text else {
            return
        }
        operatorLabel.text = ""
        configureFormulaStackView(operand: currentOperand, operator: currentOperator)
        let input = formulaString + operandLabel.text!
        var formula = ExpressionParser.parse(from: input)
        do {
            operandLabel.text = String(try formula.result())
        } catch CalculatorError.divideByZero {
            configureFormulaStackView(operand: currentOperand, operator: currentOperator)
            updateOperandLabel(with: "NAN")
        } catch {
            print(error)
        }
    }
    
    //MARK: - Helpers
    
    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
        
    private func configureFormulaStackView(operand: String, `operator`: String) {
        let operandLabel = makeLabel(text: operand)
        let operatorLabel = makeLabel(text: `operator`)
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        formulaStackView.addArrangedSubview(stackView)
    }
    
    private func updateOperandLabel(with newOperand: String) {
        operandLabel.text = newOperand
    }
}
