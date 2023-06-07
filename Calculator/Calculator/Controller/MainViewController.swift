//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var formulaListScrollView: UIScrollView!
    @IBOutlet private weak var formulaListStackView: UIStackView!
    
    private var isReset: Bool = false
    
    private var operatorValue: String {
        get {
            return operatorLabel.text ?? MultiUseString.empty.value
        }
        set(newOperator) {
            operatorLabel.text = newOperator
        }
    }
    
    private var operandValue: String {
        get {
            return operandLabel.text ?? MultiUseString.zero.value
        }
        set(newOperand) {
            operandLabel.text = newOperand
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabelTexts(newOperand: MultiUseString.zero.value, newOperator: MultiUseString.empty.value)
    }
    
    
    private func setUpLabelTexts(newOperand: String, newOperator: String) {
        operandLabel.text = newOperand
        operatorLabel.text = newOperator
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        let operators: [String] = Operator.allCases.map { String($0.rawValue) }
        
        if let buttonType = MenuType(rawValue: senderTitle) {
            guard buttonType == .equalSign else {
                touchUpMenuButton(buttonType: buttonType)
                return
            }
            do {
                try touchUpEqualButton()
            } catch CalculatorError.divideByZero {
                operandValue = MultiUseString.nan.value
                operatorValue = MultiUseString.empty.value
            } catch {
                print(CalculatorError.unknown.message)
            }
        } else if operators.contains(senderTitle) {
            touchUpOperatorButton(senderTitle: senderTitle)
        } else {
            touchUpNumberButton(senderTitle: senderTitle)
        }
    }
    
    private func touchUpMenuButton(buttonType: MenuType) {
        switch buttonType {
        case .allClear:
            touchUpACButton()
        case .clearEntry:
            touchUpCEButton()
        case .signToggle:
            touchUpSignToggleButton()
        default:
            return
        }
    }
    
    private func touchUpACButton() {
        operandValue = MultiUseString.zero.value
        operatorValue = MultiUseString.empty.value
        deleteAllFormulaListStackView()
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            stack.removeFromSuperview()
        }
    }
    
    private func touchUpCEButton() {
        operandValue = MultiUseString.zero.value
    }
    
    private func touchUpSignToggleButton() {
        guard operandValue != MultiUseString.zero.value,
              let operandNumber = Double(operandValue) else { return }
        let toggledNumber = formatNumber(operandNumber * (-1))
        operandValue = toggledNumber
    }
    
    private func touchUpEqualButton() throws {
        guard operatorValue != MultiUseString.empty.value else { return }
        
        addNewFormulaStackView()
    
        let allFormula = mergeAllFormulaList()
        var formula = ExpressionParser.parse(from: allFormula)

        operandValue = formatNumber(try formula.result())
        operatorValue = MultiUseString.empty.value
    }
    
    private func addNewFormulaStackView() {
        let newFormulaStackView = UIStackView()
        let newOperatorLabel = UILabel()
        let newOperandLabel = UILabel()
        
        newOperatorLabel.text = operatorValue
        newOperandLabel.text = operandValue.replacingOccurrences(of: ",", with: "")
        newOperandLabel.textColor = .white
        newOperatorLabel.textColor = .white
        newFormulaStackView.addArrangedSubview(newOperatorLabel)
        newFormulaStackView.addArrangedSubview(newOperandLabel)
        formulaListStackView.addArrangedSubview(newFormulaStackView)
        setUpScrollViewOffset()
    }
    
    private func setUpScrollViewOffset() {
        let offset = CGPoint(x: 0, y: formulaListScrollView.contentSize.height)
        formulaListScrollView.setContentOffset(offset, animated: false)
        formulaListScrollView.layoutSubviews()
    }
    
    private func mergeAllFormulaList() -> String {
        var mergedFormulaList: [String] = []
        let formulaList = flattenFormulaList()
        
        formulaList.forEach { text in
            let lastResult = mergedFormulaList.popLast() ?? ""
            mergedFormulaList.append(lastResult + text)
        }

        isReset = true
        return mergedFormulaList.popLast() ?? ""
    }
    
    private func flattenFormulaList() -> [String] {
        var result: [String] = []
        let formulaList = formulaListStackView.arrangedSubviews.reduce([]) { $0 + $1.subviews }
        for item in formulaList {
            guard let singleLabel = item as? UILabel,
                  let labelText = singleLabel.text else { continue }
            result.append(labelText)
        }
        return result
    }
    
    private func touchUpOperatorButton(senderTitle: String) {
        if operandValue != MultiUseString.zero.value {
            addNewFormulaStackView()
            operandValue = MultiUseString.zero.value
        }
        operatorValue = senderTitle
    }
    
    private func touchUpNumberButton(senderTitle: String) {
        if senderTitle == MultiUseString.dot.value && operandValue.contains(senderTitle) {
            return
        }
        guard operandValue != MultiUseString.zero.value else {
            operandValue = senderTitle == MultiUseString.doubleZero.value ? MultiUseString.zero.value : senderTitle
            return
        }
        guard !isReset else {
            addNewFormulaStackView()
            operandValue = senderTitle == MultiUseString.doubleZero.value ? MultiUseString.zero.value : senderTitle
            isReset = false
            return
        }
        operandValue += senderTitle
    }

    private func formatNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: number)
        else {
            return MultiUseString.empty.value
        }
        
        return numberFormatted
    }
}
