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
        guard let currentOperator = sender.currentTitle,
              let currentOperands = operandsLabel.text else {
            return
        }
        configureFormulaStackView(operands: currentOperands, operator: currentOperator)
        operatorLabel.text = currentOperator
        operandsLabel.text = "0"
        appendInputToFormula()
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
        do {
            let formula = try ExpressionParser.parse(from: formulaString)
            formula.result()
        } catch CalculatorError.divideByZero {
            operandsLabel.text = "NAN"
        }
    }
    
    //MARK: - Helpers
    
    func makeLabel(text: String) -> UILabel {
       let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
        
    func configureFormulaStackView(operands: String, `operator`: String) {
        let operandLabel = makeLabel(text: operands)
        let operatorLabel = makeLabel(text: `operator`)
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        formulaStackView.addArrangedSubview(stackView)
    }
    
    func appendInputToFormula() {
        guard let `operator` = operatorLabel.text,
              let operands = operandsLabel.text else {
                  return
        }
        formulaString += operands + `operator`
    }
}
