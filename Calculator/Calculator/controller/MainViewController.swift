//
//  Calculator - ViewController.swift
//  Created by sehong.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var calculateItemStackView: CalculateItemStackView!
    @IBOutlet private weak var calculateItemScrollView: CalculateItemScrollView!
    
    private var inputHandler = InputHandler()
    private let numberFormatter = NumberFormatter(numberStyle: .decimal,
                                                  roundingMode: .halfUp,
                                                  usesSignificantDigits: true,
                                                  maximumSignificantDigits: 20)
    private var currentItem: CurrentItem {
        return (operatorLabel.text ?? Sign.empty, operandLabel.text ?? Sign.zero)
    }
    private var isFirstItem: Bool = true
    private var isFinishedCalculation: Bool = false
    
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
    
    @IBAction private func touchOperandButton(_ sender: UIButton) {
        guard let inputOperand = sender.currentTitle else { return }
        guard isFinishedCalculation == false else {
            setInitialCurrentCalculateItem()
            setInitialCalculateItemStackView()
            operandLabel.text = inputOperand
            isFinishedCalculation = false
            return
        }
        
        if currentItem.operand != Sign.zero {
            let nextOperand = currentItem.operand + inputOperand
            operandLabel.text = numberFormatter.convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
        
        isFirstItem = false
    }
    
    @IBAction private func touchDotButton(_ sender: UIButton) {
        guard currentItem.operand.contains(Sign.dot) == false else { return }
        
        operandLabel.text = currentItem.operand + Sign.dot
    }
    
    @IBAction private func touchZeroButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        
        if currentItem.operand != Sign.zero, currentItem.operand.contains(Sign.dot) {
            operandLabel.text = currentItem.operand + senderTitle
        } else {
            operandLabel.text = numberFormatter.convertToDecimal(from: currentItem.operand + senderTitle)
        }
    }
    
    @IBAction private func allClear(_ sender: UIButton) {
        setInitialCalculateItemStackView()
        setInitialCurrentCalculateItem()
        inputHandler.setEmptyInput()
        isFirstItem = true
    }
    
    @IBAction private func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func toggleSign(_ sender: UIButton) {
        guard currentItem.operand != Sign.zero,
              let convertedOperand = numberFormatter.convertToDouble(from: currentItem.operand),
              let toggledOperand = numberFormatter.convertToString(from: -convertedOperand)
        else { return }
        
        operandLabel.text = toggledOperand
    }
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle,
              isFirstItem == false else { return }
        
        if operandLabel.text == Sign.zero {
            operatorLabel.text = inputOperator
        } else {
            calculateItemStackView.add(currentItem)
            inputHandler.addInput(about: currentItem)
            setInitialCurrentCalculateItem()
            operatorLabel.text = sender.currentTitle
        }
        
        isFinishedCalculation = false
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard currentItem.operator != Sign.empty else { return }
        
        calculateItemStackView.add(currentItem)
        inputHandler.addInput(about: currentItem)
        
        var formula = ExpressionParser.parse(from: inputHandler.currentInput)
        let result = formula.result()
        
        isFinishedCalculation = true
        inputHandler.setEmptyInput()
        operatorLabel.text = Sign.empty
        
        if result.isNaN == true {
            operandLabel.text = Sign.nan
        } else {
            operandLabel.text = numberFormatter.convertToString(from: result)
        }
    }
}
