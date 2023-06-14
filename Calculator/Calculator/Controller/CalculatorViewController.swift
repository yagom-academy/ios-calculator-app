//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//  Last modify : idinaloq, Erick, Maxhyunm

import UIKit

final class CalculatorViewController: UIViewController {
    private var operationManager = OperationManager()
    
    private var operatorValue: String {
        get {
            return operatorLabel.text ?? CalculatorNamespace.empty
        }
        set(newOperator) {
            operatorLabel.text = newOperator
        }
    }
    
    private var operandValue: String {
        get {
            return OperandFormatter.removeComma(operandsLabel.text ?? CalculatorNamespace.zero)
        }
        set(newOperand) {
            operandsLabel.text = OperandFormatter.formatInput(newOperand)
        }
    }
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var calculationDetailsStackView: UIStackView!
    @IBOutlet private weak var calculationDetailsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorValue = CalculatorNamespace.empty
        operandValue = CalculatorNamespace.zero
        clearCalculationDetailsStackView()
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle,
              operandValue != CalculatorNamespace.nan else { return }
        
        let oldOperatorValue = operatorValue
        
        operationManager.addFormula(operatorValue, operandValue)
        operatorValue = inputOperator
        
        guard operandValue != CalculatorNamespace.zero else { return }
        
        addCalculationDetailsStackView(oldOperatorValue, operandValue)
        operandValue = CalculatorNamespace.zero
    }
    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        guard operatorValue != CalculatorNamespace.empty else { return }
        
        operationManager.addFormula(operatorValue, operandValue)
        addCalculationDetailsStackView(operatorValue, operandValue)
        operandValue = operationManager.calculateFormula()
        operatorValue = CalculatorNamespace.empty
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        let result = operationManager.addOperandsLabel(operandValue, inputNumber)
        operandValue = result
    }
    
    @IBAction private func tapFunctionButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case CalculatorNamespace.allClear:
            operatorValue = CalculatorNamespace.empty
            operandValue = CalculatorNamespace.zero
            clearCalculationDetailsStackView()
            operationManager.clearFormula()
        case CalculatorNamespace.clearEntry:
            operandValue = CalculatorNamespace.zero
        case CalculatorNamespace.signToggle:
            let result = operationManager.changeSign(operandValue)
            operandValue = result
        default:
            break
        }
    }
}

extension CalculatorViewController {
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        if `operator` == CalculatorNamespace.empty && operands == CalculatorNamespace.empty {
            return
        }
        
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "\(`operator`) \(operands)"
        
        calculationDetailsStackView.addArrangedSubview(label)
        calculationDetailsScrollView.layoutIfNeeded()
        calculationDetailsScrollView.scrollToBottom(animated: false)
    }
    
    private func clearCalculationDetailsStackView() {
        calculationDetailsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

