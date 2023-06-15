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
        
        let result = operationManager.addFormula(operatorValue, operandValue)
        operatorValue = inputOperator
        
        guard operandValue != CalculatorNamespace.zero else { return }
        
        addCalculationDetailsStackView(result.operatorValue, result.operandValue)
        operandValue = CalculatorNamespace.zero
    }
    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        guard operatorValue != CalculatorNamespace.empty else { return }
        
        let result = operationManager.addFormula(operatorValue, operandValue)
        
        addCalculationDetailsStackView(result.operatorValue, result.operandValue)
        operandValue = operationManager.calculateFormula()
        operatorValue = CalculatorNamespace.empty
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        operandValue = operationManager.addOperandsLabel(operandValue, inputNumber)
    }
    
    @IBAction private func tapClearButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case CalculatorNamespace.allClear:
            operatorValue = CalculatorNamespace.empty
            operandValue = CalculatorNamespace.zero
            clearCalculationDetailsStackView()
            operationManager.clearFormula()
        case CalculatorNamespace.clearEntry:
            operandValue = CalculatorNamespace.zero
        default:
            break
        }
    }
    
    @IBAction private func tapSignToggleButton(_ sender: UIButton) {
        operandValue = operationManager.changeSign(operandValue)
    }
}

extension CalculatorViewController {
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        if `operator` == CalculatorNamespace.empty && operands == CalculatorNamespace.empty {
            return
        }
        
        let operandsText = OperandFormatter.formatStringOperand(operands)
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "\(`operator`) \(operandsText)"
        
        calculationDetailsStackView.addArrangedSubview(label)
        calculationDetailsScrollView.layoutIfNeeded()
        calculationDetailsScrollView.scrollToBottom(animated: false)
    }
    
    private func clearCalculationDetailsStackView() {
        calculationDetailsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

