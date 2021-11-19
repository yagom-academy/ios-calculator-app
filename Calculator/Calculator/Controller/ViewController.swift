//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var operandsLabel: UILabel!
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
        guard let currentNumber = operandsLabel.text,
              let newNumber = sender.currentTitle else {
            return
        }
        if currentNumber == "0" {
            operandsLabel.text = newNumber
        } else {
            operandsLabel.text = currentNumber + newNumber
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let newOperator = sender.currentTitle,
              let currentOperands = operandsLabel.text,
              let currentOperator = operatorLabel.text else {
            return
        }
        if operatorLabel.text == "" {
            configureFormulaStackView(operands: currentOperands, operator: "")
        } else {
            configureFormulaStackView(operands: currentOperands, operator: currentOperator)
        }
        operatorLabel.text = newOperator
        operandsLabel.text = "0"
        formulaString += currentOperands + newOperator
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandsLabel.text,
              let intValue = Int(currentOperand) else {
            return
        }
        if intValue > 0 {
            operandsLabel.text = "-" + currentOperand
        } else {
            operandsLabel.text = operandsLabel.text?.replacingOccurrences(of: "-", with: "")
        }
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        if let currentNumber = operandsLabel.text, currentNumber == "0" {
            return
        }
        operandsLabel.text?.removeLast()
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        formulaStackView.subviews.forEach { $0.removeFromSuperview() }
        operandsLabel.text = "0"
        operatorLabel.text = ""
        formulaString = ""
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandsLabel.text else {
            return
        }
        if currentOperand.contains(".") {
            return
        } else {
            operandsLabel.text = currentOperand + "."
        }
    }
    
    @IBAction func euqualButtonTapped(_ sender: UIButton) {
        guard let currentOperands = operandsLabel.text,
              let currentOperator = operatorLabel.text else {
                  return
              }
        
        operatorLabel.text = ""
        do {
            let input = formulaString + operandsLabel.text!
            var formula = ExpressionParser.parse(from: input)
            
            operandsLabel.text = String(try formula.result())
            configureFormulaStackView(operands: currentOperands, operator: currentOperator)
        } catch CalculatorError.divideByZero {
            operandsLabel.text = "NAN"
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
        
    private func configureFormulaStackView(operands: String, `operator`: String) {
        let operandLabel = makeLabel(text: operands)
        let operatorLabel = makeLabel(text: `operator`)
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        formulaStackView.addArrangedSubview(stackView)
    }
    
    private func appendInputToFormula() {
        guard let `operator` = operatorLabel.text,
              let operands = operandsLabel.text else {
            return
        }
        formulaString += operands + `operator`
    }
}
