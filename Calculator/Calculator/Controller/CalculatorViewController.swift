//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var currentNumberLabel: UILabel!
    @IBOutlet var currentOperatorLabel: UILabel!
    @IBOutlet var historyStackView: UIStackView!
    
    private var currentNumberString = ""
    private var currentOperatorString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removePlaceholderViews()
        updateCurrentLabels()
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        currentNumberString += numberPressedString
        update(label: self.currentNumberLabel, to: currentNumberString)
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        addToStackView()
        guard let operatorPressedString = sender.accessibilityIdentifier else {
            return
        }
        currentOperatorString = operatorPressedString
        update(label: self.currentOperatorLabel, to: currentOperatorString)
        updateCurrentLabels()
    }
    
    private func removePlaceholderViews() {
        historyStackView.arrangedSubviews.forEach { placeHolderView in
            placeHolderView.removeFromSuperview()
        }
    }
    
    private func update(label: UILabel, to data: String) {
        label.text = data
    }
    
    private func addToStackView() {
        let formulaStackView = createFormulaStackView(with: currentOperatorString, and: currentNumberString)
        historyStackView.addArrangedSubview(formulaStackView)
    }
    
    private func createFormulaStackView(with operator: String, and operand: String) -> UIStackView {
        let stackView = UIStackView()
        let operandLabel = createLabel(with: operand)
        let operatorLabel = createLabel(with: `operator`)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
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
    
    private func updateCurrentLabels() {
        self.currentNumberLabel.text = "0"
        self.currentNumberString = ""
    }
}

