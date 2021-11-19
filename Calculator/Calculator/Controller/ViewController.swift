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
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              let newDigit = sender.currentTitle else {
            return
        }
        if currentOperand == "0" {
            operandLabel.text = newDigit
        } else {
            operandLabel.text = currentOperand + newDigit
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let newOperator = sender.currentTitle,
              let currentOperand = operandLabel.text,
              let currentOperator = operatorLabel.text else {
            return
        }
        if operatorLabel.text == "" {
            configureFormulaStackView(operand: currentOperand, operator: "")
        } else {
            configureFormulaStackView(operand: currentOperand, operator: currentOperator)
        }
        operatorLabel.text = newOperator
        operandLabel.text = "0"
        formulaString += currentOperand + newOperator
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              let intValue = Int(currentOperand) else {
            return
        }
        if intValue > 0 {
            operandLabel.text = "-" + currentOperand
        } else {
            operandLabel.text = operandLabel.text?.replacingOccurrences(of: "-", with: "")
        }
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
                currentOperand != "0" else {
            return
        }
        operandLabel.text?.removeLast()
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        formulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        formulaString = ""
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text else {
            return
        }
        if currentOperand.contains(".") {
            return
        } else {
            operandLabel.text = currentOperand + "."
        }
    }
    
    @IBAction func euqualButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              let currentOperator = operatorLabel.text else {
            return
        }
        operatorLabel.text = ""
        do {
            let input = formulaString + operandLabel.text!
            var formula = ExpressionParser.parse(from: input)
            
            operandLabel.text = String(try formula.result())
            configureFormulaStackView(operand: currentOperand, operator: currentOperator)
        } catch CalculatorError.divideByZero {
            configureFormulaStackView(operand: currentOperand, operator: currentOperator)
            operandLabel.text = "NAN"
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
}
