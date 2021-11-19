//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var currentOperandLabel: UILabel!
    @IBOutlet var currentOperatorLabel: UILabel!
    @IBOutlet var historyStackView: UIStackView!
    
    private var isPositiveOperand = true
    private var currentOperand = ""
    private var currentOperator = ""
    private var isZero: Bool {
        return currentOperand == "0"
    }
    private var isNotZero: Bool {
        return currentOperand != "0"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaStackViews()
        resetCurrentOperand()
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        if isZero {
            currentOperand = ""
        }
        currentOperand += numberPressedString
        update(label: currentOperandLabel, to: currentOperand)
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        guard let operatorPressedString = sender.accessibilityIdentifier,
              isNotZero else {
            return
        }
        updateHistoryStackView(with: currentOperator, and: currentOperand)
        currentOperator = operatorPressedString
        update(label: currentOperatorLabel, to: currentOperator)
        resetCurrentOperand()
    }
    
    @IBAction func acButtonPressed(_ sender: Any) {
        removeFormulaStackViews()
        resetCurrentOperand()
    }
    
    @IBAction func ceButtonPressed(_ sender: Any) {
        resetCurrentOperand()
    }
    
    @IBAction func toggleSignButtonPressed(_ sender: Any) {
        guard isNotZero else {
            return
        }
        isPositiveOperand.toggle()
        toggleSignOfOperand()
    }
    
}

extension CalculatorViewController {
    private func removeFormulaStackViews() {
        historyStackView.arrangedSubviews.forEach { placeHolderView in
            placeHolderView.removeFromSuperview()
        }
    }
    
    private func update(label: UILabel, to data: String) {
        label.text = data
    }
    
    private func updateHistoryStackView(with currentOperator: String, and currentOperand: String) {
        let formulaStackView = createFormulaStackView(with: currentOperator, and: currentOperand)
        add(formulaStackView, to: historyStackView)
    }
    
    private func add(_ formulaStackView: UIStackView, to historyStackView: UIStackView) {
        historyStackView.addArrangedSubview(formulaStackView)
    }
    
    private func createFormulaStackView(with currentOperator: String, and currentOperand: String) -> UIStackView {
        let formulaStackView = createStackView()
        let operandLabel = createLabel(with: currentOperand)
        if historyStackView.arrangedSubviews.isEmpty {
            formulaStackView.addArrangedSubview(operandLabel)
            return formulaStackView
        }
        let operatorLabel = createLabel(with: currentOperator)
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        return formulaStackView
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createLabel(with item: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = item
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        return label
    }
    
    private func resetCurrentOperand() {
        currentOperand = "0"
        currentOperandLabel.text = "0"
    }
    
    private func toggleSignOfOperand() {
        if isPositiveOperand {
            currentOperand = currentOperand.filter { $0.isNumber }
        } else {
            currentOperand = "-" + currentOperand
        }
        update(label: currentOperandLabel, to: currentOperand)
    }
}

