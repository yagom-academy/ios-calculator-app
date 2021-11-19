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
    
    private var currentOperand: String {
        get {
            guard let currentOperand = currentOperandLabel.text else {
                return ""
            }
            return currentOperand
        }
        set {
            currentOperandLabel.text = newValue
        }
    }
    
    private var currentOperator: String {
        get {
            guard let currentOperator = currentOperatorLabel.text else {
                return ""
            }
            return currentOperator
        }
        set {
            currentOperatorLabel.text = newValue
        }
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
        if currentOperand == "0" {
            currentOperand = ""
        }
        currentOperand += numberPressedString
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        guard let operatorPressedString = sender.accessibilityIdentifier,
              currentOperand != "0" else {
            return
        }
        updateHistoryStackView(with: currentOperator, and: currentOperand)
        currentOperator = operatorPressedString
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
        isPositiveOperand.toggle()
        if isPositiveOperand {
            currentOperand = currentOperand.filter { $0.isNumber }
        } else {
            currentOperand = "-" + currentOperand
        }
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
        self.currentOperand = "0"
    }
}

