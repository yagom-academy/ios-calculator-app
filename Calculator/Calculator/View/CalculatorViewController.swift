//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var historyScrollView: UIScrollView!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var lastOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    private var isInputZero: Bool = false
    private var formula: String = Constants.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func resetlastOperatorLabel() {
        lastOperatorLabel.text = Constants.empty
    }
    
    private func resetCurrentNumberLabel() {
        currentNumberLabel.text = Constants.zero
        isInputZero = false
    }
    
    private func resetFormula() {
        formula = Constants.empty
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else { return }
        
        if currentNumber.contains(Constants.dot) {
            currentNumberLabel.text = currentNumber + String(sender.tag)
        } else {
            currentNumber += String(sender.tag)
            currentNumberLabel.text = Formatter.toFormattedString(from: currentNumber)
        }

        isInputZero = true
    }
    
    @IBAction private func touchUpZeroButton(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else { return }
        
        if currentNumber.contains(Constants.dot) {
            currentNumberLabel?.text = currentNumber + Constants.zero
            return
        }
        
        if currentNumber == Constants.zero, !isInputZero {
            currentNumberLabel?.text = Constants.zero
            isInputZero = true
            return
        }
        
        if currentNumber == Constants.zero, isInputZero {
            return
        }
        
        currentNumber += Constants.zero
        currentNumberLabel.text = currentNumber
    }
    
    @IBAction private func touchUpDoubleZeroButton(_ sender: UIButton) {
        guard var currentNumber = currentNumberLabel.text else { return }
        
        if currentNumber.contains(Constants.dot) {
            currentNumberLabel?.text = currentNumber + Constants.doubleZero
        } else {
            currentNumber += String(Constants.doubleZero)
            currentNumberLabel.text = Formatter.toFormattedString(from: currentNumber)
        }
        
        isInputZero = true
    }

    private func formatToNumber(_ number: String) -> String {
        guard let formattedNumber = Formatter.toFormattedString(from: number) else {
            return Constants.empty
        }
        
        return formattedNumber
    }

    @IBAction private func touchUpDecimalButton(_ sender: UIButton) {
        guard let currentNumber = currentNumberLabel.text,
              !currentNumber.contains(Constants.dot),
              isInputZero else { return }
        
        currentNumberLabel.text = currentNumber + Constants.dot
        isInputZero = true
    }
    
    @IBAction private func touchUpSymbolChangeButton(_ sender: UIButton) {
        guard isInputZero else { return }
        
        guard var currentNumber = currentNumberLabel.text,
              currentNumber != Constants.zero else { return }
        
        if currentNumber.first == Character(Constants.minusSymbol) {
            currentNumber.removeFirst()
            currentNumberLabel.text = currentNumber
        } else {
            currentNumber = Constants.minusSymbol + currentNumber
            currentNumberLabel.text = currentNumber
        }
    }
    
    @IBAction private func touchUpPlusButton(_ sender: UIButton) {
        updateOperatorLabel(with: Constants.plusSymbol)
    }
    
    @IBAction private func touchUpMinusButton(_ sender: UIButton) {
        updateOperatorLabel(with: Constants.minusSymbol)
    }
    
    @IBAction private func touchUpMultiplyButton(_ sender: UIButton) {
        updateOperatorLabel(with: Constants.multiplySymbol)
    }
    
    @IBAction private func touchUpDivideButton(_ sender: UIButton) {
        updateOperatorLabel(with: Constants.divideSymbol)
    }
    
    private func updateOperatorLabel(with operatorSign: String) {
        guard isInputZero else {
            lastOperatorLabel.text = operatorSign
            return
        }
        
        addSingleFormulaLineToStackView()
        
        guard let operatorToAppend = lastOperatorLabel.text,
              let numberToAppend = currentNumberLabel.text else { return }
        formula += operatorToAppend
        formula += numberToAppend.replacingOccurrences(of: Constants.comma, with: Constants.empty)
        
        lastOperatorLabel.text = operatorSign
        resetCurrentNumberLabel()
    }
    
    private func addSingleFormulaLineToStackView() {
        let formattedNumber = Formatter.toFormattedString(from: currentNumberLabel.text)

        let formulaLine = LineStackView(operatorLabelText: lastOperatorLabel.text, operandLabelText: formattedNumber)
        
        historyStackView.addArrangedSubview(formulaLine)
        historyScrollView.scrollToBottom(animated: false)
    }
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        clearAll()
    }
    
    private func clearAll() {
        resetlastOperatorLabel()
        resetCurrentNumberLabel()
        historyStackView.removeAllSubviews()
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        guard let lastOperator = lastOperatorLabel.text,
              lastOperator != Constants.empty else { return }
        
        completeFormula()
        let calculatedResult: Double = fetchResult()
        showResult(calculatedResult)
    }
    
    private func completeFormula() {
        guard let operatorToAdd = lastOperatorLabel.text,
              let numberToAdd = currentNumberLabel.text else { return }
        
        formula += operatorToAdd
        formula += numberToAdd.replacingOccurrences(of: Constants.comma, with: Constants.empty)
        
        addSingleFormulaLineToStackView()
    }
    
    private func fetchResult() -> Double {
        var formulaToCalculate: Formula = ExpressionParser.parse(from: formula)
        
        return formulaToCalculate.result()
    }
    
    private func showResult(_ result: Double) {
        resetlastOperatorLabel()
        
        guard !result.isNaN else {
            currentNumberLabel.text = Constants.nan
            return
        }
        
        currentNumberLabel.text = formatToNumber(String(result))
        resetFormula()
    }

    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetCurrentNumberLabel()
    }
}

