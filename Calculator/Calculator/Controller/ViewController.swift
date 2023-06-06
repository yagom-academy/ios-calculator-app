//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var ceButton: UIButton!
    @IBOutlet private weak var negativeButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    
    @IBOutlet private weak var formulaListScrollView: UIScrollView!
    @IBOutlet private weak var formulaListStackView: UIStackView!
    
    private var isResultOut: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCurrentStatus()
        deleteAllFormulaListStackView()
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        switch sender {
        case acButton:
            setUpCurrentStatus()
            deleteAllFormulaListStackView()
        case ceButton:
            currentOperandLabel.text = DefaultLabelText.zero.name
        case negativeButton:
            touchUpNegativeButton()
        case divideButton, multiplyButton, subtractButton, addButton:
            touchUpOperatorButton(sender)
        case equalButton:
            touchUpEqualButton()
        default:
            touchUpNumberButton(sender)
        }
    }
    
    private func setUpCurrentStatus() {
        currentOperandLabel.text = DefaultLabelText.zero.name
        currentOperatorLabel.text = DefaultLabelText.empty.name
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            formulaListStackView.removeArrangedSubview(stack)
        }
    }
    
    private func touchUpNegativeButton() {
        guard let currentOperand = currentOperandLabel.text,
              let firstString = currentOperand.first,
              currentOperand != DefaultLabelText.zero.name else {
            return
        }
        guard String(firstString) != DefaultLabelText.negative.name else {
            currentOperandLabel.text = String(currentOperand.dropFirst(1))
            return
        }
        currentOperandLabel.text = DefaultLabelText.negative.name + currentOperand
    }
    
    private func touchUpNumberButton(_ sender: UIButton) {
        guard let currentOperand = currentOperandLabel.text,
              let senderTitle = sender.title(for:.normal) else { return }
        guard currentOperand != DefaultLabelText.zero.name else {
            currentOperandLabel.text = senderTitle
            return
        }
        guard !isResultOut else {
            deleteAllFormulaListStackView()
            currentOperandLabel.text = senderTitle
            isResultOut = false
            return
        }
        currentOperandLabel.text = currentOperand + senderTitle
    }
    
    private func touchUpOperatorButton(_ sender: UIButton) {
        guard let currentOperand = currentOperandLabel.text,
              let senderTitle = sender.title(for:.normal) else {
            return
        }
        guard !isResultOut else { return }
        guard currentOperand != DefaultLabelText.zero.name else {
            currentOperatorLabel.text = senderTitle
            return
        }
        addNewFormulaStackView()
        currentOperandLabel.text = DefaultLabelText.zero.name
        currentOperatorLabel.text = senderTitle
    }
    
    private func touchUpEqualButton() {
        guard let currentOperator = currentOperatorLabel.text,
              currentOperator != DefaultLabelText.empty.name else {
            return
        }
        addNewFormulaStackView()
        let allFormula = mergeAllFormulaList()
        isResultOut = true
        var formula = ExpressionParser.parse(from: allFormula)
        do {
            let result = try formatNumber(formula.result())
            currentOperandLabel.text = result
            currentOperatorLabel.text = DefaultLabelText.empty.name
        } catch CalculatorError.divideByZero {
            currentOperatorLabel.text = DefaultLabelText.empty.name
            currentOperandLabel.text = DefaultLabelText.nan.name
        } catch {
            print(CalculatorError.unknown.message)
        }
    }
    
    private func addNewFormulaStackView() {
        guard let currentOperand = currentOperandLabel.text,
              let currentOperator = currentOperatorLabel.text else {
            return
        }
        let newFormulaStackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        operatorLabel.text = currentOperator
        operandLabel.text = currentOperand
        operandLabel.textColor = .white
        operatorLabel.textColor = .white
        newFormulaStackView.addArrangedSubview(operatorLabel)
        newFormulaStackView.addArrangedSubview(operandLabel)
        formulaListStackView.addArrangedSubview(newFormulaStackView)
    }
    
    private func mergeAllFormulaList() -> String {
        var result: String = ""
        let formulaList = formulaListStackView.arrangedSubviews.reduce([]) { mergedResult, subView in
            mergedResult + subView.subviews
        }
        for item in formulaList {
            guard let singleLabel = item as? UILabel,
                  let labelText = singleLabel.text else {
                break
            }
            result += labelText
        }
        return result
    }

    func formatNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: number) else { return DefaultLabelText.empty.name }
        
        return numberFormatted
    }
}

