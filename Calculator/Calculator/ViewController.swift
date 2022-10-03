//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    private var calculator: Calculator = Calculator()
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperatorLabel()
        resetOperandLabel()
        removeAllSubviewsInHistoryStackView()
    }
    
    private func resetOperatorLabel() {
        calculator.resetCurrentOperator()
        operatorLabel.text = calculator.currentOperator
    }
    
    private func resetOperandLabel() {
        calculator.resetCurrentOperand()
        operandLabel.text = calculator.currentOperand
    }
    
    private func removeAllSubviewsInHistoryStackView() {
        historyStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func addSubViewInHistoryStackView(operatorText: String, operandText: String) {
        let stackView: UIStackView = UIStackView()
        stackView.spacing = 8
        let operatorLabel: UILabel = createLabel(labelText: operatorText)
        let operandLabel: UILabel = createLabel(labelText: operandText)
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        historyStackView.addArrangedSubview(stackView)
    }
    
    private func createLabel(labelText: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
      
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height + scrollView.contentInset.bottom)
        if(bottomOffset.y > 0) {
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    @IBAction private func touchUpClearEntryButton(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction private func touchUpAllClearButton(_ sender: UIButton) {
        resetOperandLabel()
        resetOperatorLabel()
        removeAllSubviewsInHistoryStackView()
    }
    
    @IBAction private func touchUpNumberPadButton(_ sender: UIButton) {
        if let operand: String = sender.titleLabel?.text {
            calculator.inputOperand(operand)
            operandLabel.text = calculator.currentOperand
        }
    }
    
    @IBAction private func touchUpPositiveNegativeButton(_ sender: UIButton) {
        calculator.switchPositiveNegativeOfCurrentOperand()
        operandLabel.text = calculator.currentOperand
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        let currentOperator: String = calculator.currentOperator
        let currentOperand: String = calculator.currentOperand
        guard let inputOperator: String = sender.titleLabel?.text else {
            return
        }
        if calculator.inputOperator(inputOperator) {
            addSubViewInHistoryStackView(operatorText: currentOperator, operandText: currentOperand)
            scrollToBottom()
        }
        operandLabel.text = calculator.currentOperand
        operatorLabel.text = calculator.currentOperator
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        let currentOperator: String = calculator.currentOperator
        let currentOperand: String = calculator.currentOperand
        if let result: String = calculator.inputEqual() {
            addSubViewInHistoryStackView(operatorText: currentOperator, operandText: currentOperand)
            scrollToBottom()
            operandLabel.text = result
            operatorLabel.text = calculator.currentOperator
        }
    }
}

