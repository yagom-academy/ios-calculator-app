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
    
    private let viewGenerator = ViewGenerator()
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
        resetAll()
    }
    
    private func resetAll() {
        setInitialCalculateItemStackView()
        setInitialCurrentCalculateItem()
        inputHandler.setEmptyInput()
        isFirstItem = true
        isFinishedCalculation = false
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
            resetAll()
            operandLabel.text = inputOperand
            isFirstItem = false
            return
        }
        
        if currentItem.operandText != Sign.zero {
            let nextOperand = currentItem.operandText + inputOperand
            operandLabel.text = numberFormatter.convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
        
        isFirstItem = false
    }
    
    @IBAction private func touchDotButton(_ sender: UIButton) {
        guard currentItem.operandText.contains(Sign.dot) == false else { return }
        guard isFinishedCalculation == false else {
            resetAll()
            operandLabel.text = Sign.zero + Sign.dot
            return
        }
        
        operandLabel.text = currentItem.operandText + Sign.dot
    }
    
    @IBAction private func touchZeroButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        guard isFinishedCalculation == false else {
            resetAll()
            operandLabel.text = Sign.zero
            return
        }
        
        if currentItem.operandText != Sign.zero, currentItem.operandText.contains(Sign.dot) {
            operandLabel.text = currentItem.operandText + senderTitle
        } else {
            operandLabel.text = numberFormatter.convertToDecimal(from: currentItem.operandText + senderTitle)
        }
    }
    
    @IBAction private func allClear(_ sender: UIButton) {
        resetAll()
    }
    
    @IBAction private func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func toggleSign(_ sender: UIButton) {
        guard currentItem.operandText != Sign.zero,
              let convertedOperand = numberFormatter.convertToDouble(from: currentItem.operandText),
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
            guard let currentItemStackView = viewGenerator.generateStackView(about: currentItem)
            else { return }
            
            calculateItemStackView.add(currentItemStackView)
            calculateItemScrollView.didAddSubview(currentItemStackView)
            inputHandler.addInput(about: currentItem)
            setInitialCurrentCalculateItem()
            operatorLabel.text = sender.currentTitle
        }
        
        isFinishedCalculation = false
    }
    
    @IBAction private func calculateCurrentFormula(_ sender: UIButton) {
        guard currentItem.operatorText != Sign.empty else { return }
        guard let currentItemStackView = viewGenerator.generateStackView(about: currentItem)
        else { return }
        
        calculateItemStackView.add(currentItemStackView)
        calculateItemScrollView.didAddSubview(currentItemStackView)
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
