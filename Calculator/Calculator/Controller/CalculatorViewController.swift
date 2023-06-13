//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    var operationManager = OperationManager()
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var calculationDetailsStackView: UIStackView!
    @IBOutlet private weak var calculationDetailsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearOperatorLabel()
        clearOperandsLabel()
        clearCalculationDetailsStackView()
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle,
              let currentOperator = operatorLabel.text,
              let currentOperands = operandsLabel.text else { return }
        
        let result = operationManager.addFormula(currentOperator, currentOperands)
        addCalculationDetailsStackView(result.0, result.1)
        setOperatorLabel(inputOperator)
        clearOperandsLabel()
    }
    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        guard let currentOperator = operatorLabel.text,
              let currentOperands = operandsLabel.text else { return }
        
        operationManager.addFormula(currentOperator, currentOperands)
        setOperandsLabel(operationManager.calculateFormula())
        clearOperatorLabel()
        clearCalculationDetailsStackView()
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        guard let currentOperands = operandsLabel.text,
              let inputNumber = sender.currentTitle else { return }
        
        let reuslt = operationManager.addOperandsLabel(currentOperands, inputNumber)
        setOperandsLabel(reuslt)
    }
    
    @IBAction private func tapFunctionButton(_ sender: UIButton) {
        guard let currentOperands = operandsLabel.text,
              let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case CalculatorNamespace.AllClear:
            clearOperatorLabel()
            clearOperandsLabel()
            clearCalculationDetailsStackView()
            operationManager.clearFormula()
        case CalculatorNamespace.ClearEntry:
            clearOperandsLabel()
        case CalculatorNamespace.SignToggle:
            let result = operationManager.changeSign(currentOperands)
            setOperandsLabel(result)
        default:
            break
        }
    }
    
    private func setOperatorLabel(_ data: String) {
        operatorLabel.text = data
    }
    
    private func setOperandsLabel(_ data: String) {
        operandsLabel.text = data
    }
    
    private func clearOperatorLabel() {
        operatorLabel.text?.removeAll()
    }
    
    private func clearOperandsLabel() {
        operandsLabel.text = CalculatorNamespace.Zero
    }
}

extension CalculatorViewController {
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        if `operator` == "0" && operands == "0" {
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

