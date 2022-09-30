//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var lastOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
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
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        updateCurrentNumberLabel(with: String(sender.tag))
        isInputZero = true
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        guard isInputZero else  { return }
        updateCurrentNumberLabel(with: Constants.doubleZero)
    }

    private func formatToNumber(_ number: String) -> String {
        guard let formattedNumber = Formatter.toFormattedString(from: number) else {
            return Constants.empty
        }
        
        return formattedNumber
    }
    
    func updateCurrentNumberLabel(with input: String) {
        guard var curNumStr = currentNumberLabel.text else { return }
        
        if curNumStr == Constants.zero, input != Constants.doubleZero {
            curNumStr = input
        } else if curNumStr != Constants.zero {
            curNumStr += input
        }
        
        if curNumStr.contains(Constants.dot) {
            currentNumberLabel.text = curNumStr
        } else {
            currentNumberLabel.text = Formatter.toFormattedString(from: curNumStr)
        }
    }

    @IBAction func touchUpDecimalButton(_ sender: UIButton) {
        guard let currentNumber = currentNumberLabel.text,
              !currentNumber.contains(Constants.dot),
              isInputZero else { return }
        
        currentNumberLabel.text = currentNumber + Constants.dot
    }
    
    @IBAction func touchUpSymbolChangeButton(_ sender: UIButton) {
        changeSymbol()
    }
    
    private func changeSymbol() {
        guard isInputZero else { return }
        
        guard var currentNumber = currentNumberLabel.text else { return }
        
        if currentNumber.first == Character(Constants.minusSymbol) {
            currentNumber.removeFirst()
            currentNumberLabel.text = currentNumber
        } else {
            currentNumber = Constants.minusSymbol + currentNumber
            currentNumberLabel.text = currentNumber
        }
    }
    
    @IBAction func touchUpPlusButton(_ sender: UIButton) {
        updateOperatorLabel(Constants.plusSymbol)
    }
    
    @IBAction func touchUpMinusButton(_ sender: UIButton) {
        updateOperatorLabel(Constants.minusSymbol)
    }
    
    @IBAction func touchUpMultiplyButton(_ sender: UIButton) {
        updateOperatorLabel(Constants.multiplySymbol)
    }
    
    @IBAction func touchUpDivideButton(_ sender: UIButton) {
        updateOperatorLabel(Constants.divideSymbol)
    }
    
    private func updateOperatorLabel(_ operatorSign: String) {
        guard isInputZero else {
            lastOperatorLabel.text = operatorSign
            return
        }
        
        addToStackView()
        
        guard let operatorToAdd = lastOperatorLabel.text,
              let numberToAdd = currentNumberLabel.text else { return }
        formula += operatorToAdd
        formula += numberToAdd.replacingOccurrences(of: Constants.comma, with: Constants.empty)
        
        lastOperatorLabel.text = operatorSign
        resetCurrentNumberLabel()
    }
    
    private func addToStackView() {
        guard let lastOperatorLabelText = lastOperatorLabel.text,
              let currentNumber = currentNumberLabel.text,
              let formattedNumber = Formatter.toFormattedString(from: currentNumber) else { return }

        let stack = LineStackView(operatorStr: lastOperatorLabelText, operandStr: formattedNumber)
        
        historyStackView.addArrangedSubview(stack)
        historyScrollView.scrollToBottom(animated: false)
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        clearAll()
    }
    
    private func clearAll() {
        resetlastOperatorLabel()
        resetCurrentNumberLabel()
        historyStackView.removeAllSubviews(of: historyStackView)
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
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
        
        addToStackView()
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

    @IBAction func touchUpCEButton(_ sender: UIButton) {
        resetCurrentNumberLabel()
    }
}

