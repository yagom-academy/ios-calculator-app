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
        operandValue = MultiUseString.zero.value
        operatorValue = MultiUseString.empty.value
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        let operators: [String] = Operator.allCases.map { String($0.rawValue) }
        let menus: [String] = MenuType.allCases.map { $0.rawValue }
        
        if senderTitle == "=" {
            do {
                try touchUpEqualButton()
            } catch CalculatorError.divideByZero {
                operandValue = MultiUseString.nan.value
                operatorValue = MultiUseString.empty.value
            } catch {
                print(CalculatorError.unknown.message)
            }
        } else if menus.contains(senderTitle) {
            guard let senderType = MenuType(rawValue: senderTitle) else { return }
            touchUpMenuButton(senderType: senderType)
        } else if operators.contains(senderTitle) {
            touchUpOperatorButton(senderTitle: senderTitle)
        } else {
            touchUpNumberButton(senderTitle: senderTitle)
        }
    }
    
    private func touchUpMenuButton(senderType: MenuType) {
        if isReset {
            isReset = false
        }
        let lableTexts: LableStatus = senderType.getLabelTexts(
            when: (operandValue: operandValue, operatorValue: operatorValue)
        )
        if senderType == .allClear {
            deleteAllFormulaListStackView()
        }
        operandValue = lableTexts.operandValue
        operatorValue = lableTexts.operatorValue
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            stack.removeFromSuperview()
        }
    }
    
    private func touchUpEqualButton() throws {
        guard operatorValue != MultiUseString.empty.value else { return }
        
        addNewFormulaStackView()
    
        let allFormula = mergeAllFormulaList()
        var formula = ExpressionParser.parse(from: allFormula)

        operandValue = OperandFormatter.formatDoubleToString(try formula.result())
        operatorValue = MultiUseString.empty.value
    }
    
    private func addNewFormulaStackView() {
        let newFormulaStackView = UIStackView()
        let newOperatorLabel = UILabel()
        let newOperandLabel = UILabel()
        
        newOperatorLabel.text = operatorValue
        newOperandLabel.text = OperandFormatter.formatStringToString(operandValue)
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
        var result: String = ""
        let formulaList = flattenFormulaList()
        
        for text in formulaList {
            guard let lastResult = mergedFormulaList.popLast(),
                  text != MultiUseString.empty.value
            else {
                mergedFormulaList.append(MultiUseString.empty.value)
                continue
            }
            result = lastResult + text
            mergedFormulaList.append(result)
        }

        isReset = true
        return result
    }
    
    private func flattenFormulaList() -> [String] {
        var result: [String] = []
        let formulaList = formulaListStackView.arrangedSubviews.reduce([]) { $0 + $1.subviews }
        for item in formulaList {
            guard let singleLabel = item as? UILabel,
                  let labelText = singleLabel.text else { continue }
            result.append(OperandFormatter.removeComma(labelText))
        }
        return result
    }
    
    private func touchUpOperatorButton(senderTitle: String) {
        if isReset {
            isReset = false
        }
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
}
