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
    private var isZero: Bool = true
    
    private var operatorValue: String {
        get {
            return operatorLabel.text ?? CalculatorNamespace.Empty
        }
        set(newOperator) {
            operatorLabel.text = newOperator
        }
    }
    
    private var operandValue: String {
        get {
            return operandLabel.text ?? CalculatorNamespace.Zero
        }
        set(newOperand) {
            operandLabel.text = newOperand
        }
    }
    
    private var currentLabelValues: LabelValues {
        get {
            return (operandValue: operandValue, operatorValue: operatorValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteAllFormulaListStackView()
        setUpLabelValues(LabelParser.getDefaultLabelValues())
    }
    
    private func setUpLabelValues(_ status: LabelValues) {
        self.operandValue = status.operandValue
        self.operatorValue = status.operatorValue
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            stack.removeFromSuperview()
        }
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        guard let senderTitle = sender.currentTitle else { return }
        let buttonType: ButtonType = ButtonType.getType(senderTitle)
        
        setIsZero(senderTitle: senderTitle)

        switch buttonType {
        case .equal:
            touchUpEqualButton()
            return
        case .operators:
            guard operandValue != CalculatorNamespace.NaN else { return }
            touchUpOperatorButton()
        case .allClear:
            deleteAllFormulaListStackView()
        case .numbers, .doubleZero, .dot:
            setIsZero(senderTitle: senderTitle)
            touchUpNumbersButton()
        default:
            break
        }
        let labelValues: LabelValues = LabelParser
            .parseLabelValues(button: buttonType,
                              buttonTitle: senderTitle,
                              labelValues: currentLabelValues,
                              isReset: isReset)
        setUpLabelValues(labelValues)
        isReset = buttonType == .signToggle ? isReset : false
    }

    private func setIsZero(senderTitle: String) {
        if senderTitle == CalculatorNamespace.Zero ||
           operandValue == CalculatorNamespace.Zero {
            isZero = true
        }
        if isZero && operandValue != CalculatorNamespace.Zero {
            if operatorValue != CalculatorNamespace.Empty {
                addNewFormulaStackView(LabelParser.getDefaultLabelValues())
            }
            isZero = false
        }
    }
    
    private func touchUpEqualButton() {
        guard operatorValue != CalculatorNamespace.Empty else { return }
        
        addNewFormulaStackView(currentLabelValues)
        
        let allFormula = mergeAllFormulaList()
        var formula = ExpressionParser.parse(from: allFormula)

        do {
            let calculatorResult = try formula.result()
            let labelValues: LabelValues = LabelParser
                .parseLabelForEqual(result: calculatorResult)
            setUpLabelValues(labelValues)
        } catch CalculatorError.divideByZero {
            setUpLabelValues(LabelParser.getNaNLabelValues())
        } catch {
            print(CalculatorError.unknown.message)
            setUpLabelValues(LabelParser.getNaNLabelValues())
        }
    }
    
    private func touchUpOperatorButton() {
        if operandValue != CalculatorNamespace.Zero {
            addNewFormulaStackView(currentLabelValues)
        }
    }
    
    private func touchUpNumbersButton() {
        if isReset {
            addNewFormulaStackView(currentLabelValues)
        }
    }

    private func addNewFormulaStackView(_ labelValues: LabelValues) {
        let newFormulaStackView = UIStackView()
        let newOperatorLabel = UILabel()
        let newOperandLabel = UILabel()
        
        newOperatorLabel.text = labelValues.operatorValue
        newOperandLabel.text = OperandFormatter.formatStringToString(labelValues.operandValue)
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
        var result: String = CalculatorNamespace.Empty
        let formulaList = flattenFormulaList()
        
        for text in formulaList {
            guard let lastResult = mergedFormulaList.popLast(),
                  text != CalculatorNamespace.Empty
            else {
                mergedFormulaList.append(CalculatorNamespace.Empty)
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
}
