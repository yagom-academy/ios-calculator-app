//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var calculateItemStackView: CalculateItemStackView!
    @IBOutlet weak var calculateItemScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter(numberStyle: .decimal,
                                          roundingMode: .halfUp,
                                          usesSignificantDigits: true,
                                          maximumSignificantDigits: 20)
    private var currentOperand: String {
        return operandLabel.text ?? Sign.zero
    }
    private var currentOperator: String {
        return operatorLabel.text ?? Sign.empty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialCurrentCalculateItem()
        setInitialCalculateItemStackView()
    }
    
    private func setInitialCurrentCalculateItem() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
    }
    
    private func setInitialCalculateItemStackView() {
        calculateItemStackView.removeAllSubviews()
    }
    
    @IBAction func touchOperandButton(_ sender: UIButton) {
        guard let inputOperand = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero {
            let nextOperand = currentOperand + inputOperand
            operandLabel.text = numberFormatter.convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard currentOperand.contains(Sign.dot) == false else { return }
        
        operandLabel.text = currentOperand + Sign.dot
    }
    
    @IBAction func touchZeroButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero,
           currentOperand.contains(Sign.dot) {
            operandLabel.text = currentOperand + senderTitle
        } else {
            operandLabel.text = numberFormatter.convertToDecimal(from: currentOperand + senderTitle)
        }
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        setInitialCalculateItemStackView()
        setInitialCurrentCalculateItem()
        InputHandler.shared.setEmptyInput()
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        guard currentOperand != Sign.zero,
              let convertedOperand = numberFormatter.convertToDouble(from: currentOperand),
              let toggledOperand = numberFormatter.convertToString(from: -convertedOperand) else { return }
        
        operandLabel.text = toggledOperand
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
            
        if operandLabel.text == Sign.zero {
            operatorLabel.text = inputOperator
        } else {
            calculateItemStackView.addCurrentItem()
            setInitialCurrentCalculateItem()
            operatorLabel.text = sender.currentTitle
        }
    }
    
    @IBAction func calculateCurrentFormula(_ sender: UIButton) {
        guard currentOperator != Sign.empty else { return }
        
        calculateItemStackView.addCurrentItem()
        
        var formula = ExpressionParser.parse(from: InputHandler.shared.currentInput)
        let result = formula.result()
        
        InputHandler.shared.setEmptyInput()
        operatorLabel.text = Sign.empty
        
        if result.isNaN == true {
            operandLabel.text = Sign.nan
        } else {
            operandLabel.text = numberFormatter.convertToString(from: result)
        }
    }
}

