//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    //MARK: - @IBOutlet Properties
    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var calculationHistoryScrollView: UIScrollView!
    
    //MARK: - Properties
    private var isPositiveOperand = true
    private var currentOperand = ""
    private var currentOperator = ""
    private var historyStack: [String] = []
    
    private var isZero: Bool {
        return currentOperand == "0"
    }
    
    private var isNotZero: Bool {
        return !isZero
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaStackViews()
        changeCurrentOperandData(to: "0")
    }
    
    //MARK: - @IBAction Methods
    @IBAction private func touchUpDigitButton(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        if isZero && numberPressedString != "." {
            setCurrentOperand(to: "")
        }
        let newOperand = currentOperand + numberPressedString
        changeCurrentOperandData(to: newOperand)
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let operatorPressedString = sender.accessibilityIdentifier,
              isNotZero else {
            return
        }
        refreshCalculateHistory(with: currentOperator, and: currentOperand)
        changeCurrentOperatorData(to: operatorPressedString)
        changeCurrentOperandData(to: "0")
        autoScrollToBottom()
    }
    
    @IBAction private func touchUpCalculateButton(_ sender: Any) {
        refreshCalculateHistory(with: currentOperator, and: currentOperand)
        setCurrentOperand(to: "0")
        guard let result = calculateResult(from: historyStack) else {
            return
        }
        clearCalculationHistory()
        update(currentOperandLabel, to: result)
        changeCurrentOperatorData(to: "")
        let newOperand = result.withoutCommas
        setCurrentOperand(to: newOperand)
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        clearCalculationHistory()
        changeCurrentOperandData(to: "0")
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        changeCurrentOperandData(to: "0")
    }
    
    @IBAction private func touchUpSignButton(_ sender: Any) {
        guard isNotZero else {
            return
        }
        toggleSignOfOperand()
    }
}

extension CalculatorViewController {
    // MARK: - Methods
    private func removeFormulaStackViews() {
        calculationHistoryStackView.arrangedSubviews
            .forEach { $0.removeFromSuperview() }
    }
    
    private func changeCurrentOperandData(to newOperand: String) {
        setCurrentOperand(to: newOperand)
        update(currentOperandLabel, to: newOperand)
    }
    
    private func setCurrentOperand(to newOperand: String) {
        currentOperand = newOperand
    }
    
    private func changeCurrentOperatorData(to newOperator: String) {
        setCurrentOperator(to: newOperator)
        update(currentOperatorLabel, to: newOperator)
    }
    
    private func setCurrentOperator(to newOperator: String) {
        currentOperator = newOperator
    }
    
    private func update(_ label: UILabel, to data: String) {
        label.text = data
    }
    
    private func autoScrollToBottom() {
        calculationHistoryScrollView.layoutIfNeeded()
        let contentSizeHeight = calculationHistoryScrollView.contentSize.height
        let boundsHeight = calculationHistoryScrollView.bounds.height
        let contentInsetBottom = calculationHistoryScrollView.contentInset.bottom
        let bottomOffset = CGPoint(x: 0, y: contentSizeHeight - boundsHeight + contentInsetBottom)
        
        if bottomOffset.y > 0 {
            calculationHistoryScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func calculateResult(from historyStack: [String]) -> String? {
        let equationString = historyStack.filter { $0 != "" }
            .joined()
        var formula = ExpressionParser.parse(from: equationString)
        let rawResult = formula.result()
        guard let result = rawResult.presentableFormat else {
            return nil
        }
        return result
    }
    
    private func refreshCalculateHistory(with currentOperator: String, and currentOperand: String) {
        updateHistoryStackView(with: currentOperator, and: currentOperand)
        historyStack.append(contentsOf: [currentOperator, currentOperand])
    }
    
    private func updateHistoryStackView(with currentOperator: String, and currentOperand: String) {
        let formulaStackView = createFormulaStackView(with: currentOperator, and: currentOperand)
        calculationHistoryStackView.addArrangedSubview(formulaStackView)
    }
    
    private func clearCalculationHistory() {
        historyStack.removeAll()
        removeFormulaStackViews()
    }
    
    private func toggleSignOfOperand() {
        isPositiveOperand.toggle()
        if isPositiveOperand {
            let newOperand = currentOperand.filter { $0.isNumber }
            setCurrentOperand(to: newOperand)
        } else {
            let newOperand = "-" + currentOperand
            setCurrentOperand(to: newOperand)
        }
        update(currentOperandLabel, to: currentOperand)
    }
    
    private func createFormulaStackView(with currentOperator: String, and currentOperand: String) -> UIStackView {
        let formulaStackView = createStackView()
        let operandLabel = createLabel(with: currentOperand)
        if calculationHistoryStackView.arrangedSubviews.isEmpty {
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
        stackView.spacing = 8.0
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
}
