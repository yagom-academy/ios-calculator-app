//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private weak var inputNumberLabel: UILabel!
    @IBOutlet private weak var inputOperatorLabel: UILabel!
    @IBOutlet private weak var formulaStackView: UIStackView!
    @IBOutlet private weak var calculatorScrollView: UIScrollView!
    
    private var entireStringFormula: String = ""
    private let negativeSign = "-"
    private let initialNumberLabel = "0"
    private let initialStringValue = ""
    
    private let numberFormatter = CalculatorNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initailizeLabel()
        initializeFormulaStackView()
    }
    
    private func initailizeLabel() {
        inputNumberLabel.text = initialNumberLabel
        inputOperatorLabel.text = initialStringValue
    }
    
    private func initializeFormulaStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    // MARK: - 숫자 버튼 입력
    
    @IBAction private func tapNumberPad(_ sender: UIButton) {
        guard let currentNumberText = inputNumberLabel.text,
             let inputNumber = sender.currentTitle else { return }
        
        if currentNumberText == initialNumberLabel {
            inputNumberLabel.text = inputNumber
        } else {
            updateInputNumberLabel(currentNumberText, with: inputNumber)
        }
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        if let currentNumberText = inputNumberLabel.text,
          let inputSign = sender.currentTitle,
         currentNumberText.contains(".") == false {
            inputNumberLabel.text = currentNumberText + inputSign
        }
    }
    
    @IBAction private func tapDoubleZeroButton(_ sender: UIButton) {
        if let currentNumberText = inputNumberLabel.text,
          let inputNum = sender.currentTitle,
         currentNumberText != initialNumberLabel {
            updateInputNumberLabel(currentNumberText, with: inputNum)
        }
    }
    
    private func updateInputNumberLabel(_ currentNumber: String, with input: String) {
        guard currentNumber.contains(".") == false else {
            inputNumberLabel.text = currentNumber + input
            return
        }
        
        let numberWithoutComma = currentNumber.replacingOccurrences(of: ",", with: "")
        let updatedNumber = numberWithoutComma + input
        if let convertedNumber = numberFormatter.string(for: Double(updatedNumber)) {
            inputNumberLabel.text = convertedNumber
        }
    }
    
    // MARK: - 연산자 버튼 입력
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let currentNumberText = inputNumberLabel.text,
             let inputOperator = sender.currentTitle else { return }

        if formulaStackView.arrangedSubviews.isEmpty,
          currentNumberText == initialNumberLabel {
            inputOperatorLabel.text = initialStringValue
        } else if currentNumberText == initialNumberLabel {
            changeOperatorLabel(with: inputOperator)
        } else {
            addFormulaStackView()
            changeOperatorLabel(with: inputOperator)
            inputNumberLabel.text = initialNumberLabel
        }
    }
    
    private func changeOperatorLabel(with input: String) {
        inputOperatorLabel.text = input
    }
    
    private func addFormulaStackView() {
        let newFormulaStack = createFormulaStack()
        formulaStackView.addArrangedSubview(newFormulaStack)
        addStringFormula()
        scrollToBottom(calculatorScrollView)
    }
    
    private func addStringFormula() {
        guard let inputNumber = inputNumberLabel.text,
             let inputOperator = inputOperatorLabel.text else { return }
        
        let inputNumberWithoutComma = inputNumber.replacingOccurrences(of: ",", with: "")
        entireStringFormula += (inputOperator + inputNumberWithoutComma)
    }
    
    // MARK: - 특수 버튼 입력
    
    @IBAction private func tapACButton(_ sender: UIButton) {
        initailizeLabel()
        entireStringFormula = initialStringValue
        initializeFormulaStackView()
    }
    
    @IBAction private func tapCEButton(_ sender: UIButton) {
        inputNumberLabel.text = initialNumberLabel
    }
    
    @IBAction private func tapPositiveNegativeButton(_ sender: UIButton) {
        guard let currentNumberText = inputNumberLabel.text,
             currentNumberText != initialNumberLabel else { return }
        
        if currentNumberText.hasPrefix(negativeSign) {
            inputNumberLabel.text = String(currentNumberText.dropFirst())
        } else {
            inputNumberLabel.text = negativeSign + currentNumberText
        }
    }
    
    @IBAction private func tapResultButton(_ sender: UIButton) {
        guard entireStringFormula != initialStringValue else { return }
        
        addFormulaStackView()
        do {
            var formula = ExpressionParser.parse(from: entireStringFormula)
            let result = try formula.result()
            updateNumberLabel(with: Decimal(result))
            inputOperatorLabel.text = initialStringValue
            entireStringFormula = initialStringValue
        } catch CalculatorError.emptyQueue {
            return
        } catch {
            print(error)
        }
    }
    
    private func updateNumberLabel(with result: Decimal) {
        if let convertedNumber = numberFormatter.string(for: result) {
            inputNumberLabel.text = convertedNumber
        }
    }
    
    // MARK: - 자동 스크롤
    
    private func scrollToBottom(_ scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(
            CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height),
            animated: true
        )
    }
    
}

// MARK: - stackView 생성

extension CalculatorViewController {
    
    func createFormulaStack() -> UIStackView {
        let formulaStack = FormulaStackView()
        formulaStack.addArrangedSubview(operatorLabel)
        formulaStack.addArrangedSubview(operandsLabel)
        
        return formulaStack
    }
    
    private var operatorLabel: UILabel {
        let operatorLabel = FormulaLabel()
        operatorLabel.text = inputOperatorLabel.text
        
        return operatorLabel
    }
    
    private var operandsLabel: UILabel {
        let operandsLabel = FormulaLabel()
        operandsLabel.text = inputNumberLabel.text
        
        return operandsLabel
    }
    
}

