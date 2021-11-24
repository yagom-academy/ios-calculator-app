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
    private var historyStack: [String] = []
    private var currentOperand = ""
    private var currentOperator = ""
    
    private var currentOperandLabelText: String {
        get {
            return currentOperandLabel.text ?? "0"
        }
        set {
            currentOperandLabel.text = newValue
        }
    }
    
    private var isZeroDuringInput: Bool {
        return currentOperand.isZero && !historyStack.isEmpty
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaStackViews()
        updateCurrentOperandValueAndLabel(to: "0")
        updateCurrentOperatorValueAndLabel(to: "")
    }
    
    //MARK: - @IBAction Methods
    @IBAction private func touchUpDigitButton(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        let newOperand = currentOperand + numberPressedString
        do {
            guard let formattedOperand = try newOperand.convertNumberToPresentableFormat() else {
                return
            }
            updateCurrentOperandValue(to: newOperand)
            update(currentOperandLabel, to: formattedOperand)
        } catch let error {
            print(error)
        }
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let operatorPressedString = sender.accessibilityIdentifier else {
            return
        }
        if isZeroDuringInput {
            updateCurrentOperatorValueAndLabel(to: operatorPressedString)
            return
        }
        if currentOperand.isNotZero {
            updateHistoryStackView(with: currentOperator, and: currentOperandLabelText)
            updateHistoryStack(with: currentOperator, and: currentOperand)
            updateCurrentOperatorValueAndLabel(to: operatorPressedString)
            updateCurrentOperandValueAndLabel(to: "0")
            autoScrollToBottom()
        }
    }
    
    @IBAction private func touchUpCalculateButton(_ sender: Any) {
        updateHistoryStack(with: currentOperator, and: currentOperand)
        updateHistoryStackView(with: currentOperator, and: currentOperandLabelText)
        
        let result = calculateResult(from: historyStack)
        if let presentableResult = result.presentableFormat {
            update(currentOperandLabel, to: presentableResult)
        }
        
        updateCurrentOperandValue(to: result.convertToString)
        updateCurrentOperatorValueAndLabel(to: "")
        clearHistoryStack()
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        clearCalculationHistory()
        clearHistoryStack()
        updateCurrentOperandValueAndLabel(to: "0")
        updateCurrentOperatorValueAndLabel(to: "")
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        updateCurrentOperandValueAndLabel(to: "0")
    }
    
    @IBAction private func touchUpSignButton(_ sender: Any) {
        guard currentOperand.isNotZero,
              let doubleOperand = Double(currentOperand),
              doubleOperand != 0 else {
            return
        }
        guard let newOperand = (doubleOperand * -1).presentableFormat else {
            return
        }
        updateCurrentOperandValueAndLabel(to: newOperand)
    }
}

extension CalculatorViewController {
    // MARK: - Methods
    private func removeFormulaStackViews() {
        calculationHistoryStackView.arrangedSubviews
            .forEach { $0.removeFromSuperview() }
    }
    
    private func updateCurrentOperandValueAndLabel(to newOperand: String) {
        updateCurrentOperandValue(to: newOperand)
        update(currentOperandLabel, to: newOperand)
    }
    
    private func updateCurrentOperandValue(to newOperand: String) {
        currentOperand = newOperand
    }
    
    private func updateCurrentOperatorValueAndLabel(to newOperator: String) {
        updateCurrentOperatorValue(to: newOperator)
        update(currentOperatorLabel, to: newOperator)
    }
    
    private func updateCurrentOperatorValue(to newOperator: String) {
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
    
    private func calculateResult(from historyStack: [String]) -> Double {
        let equationString = historyStack.filter { $0 != "" }
            .joined()
        var formula = ExpressionParser.parse(from: equationString)
        let result = getCalculationResult(from: &formula)
        return result
    }
    
    private func getCalculationResult(from formula: inout Formula) -> Double {
        var result = 0.0
        do {
            try result = formula.result()
        } catch CalculateItemQueueError.queueIsEmpty {
            print(CalculateItemQueueError.queueIsEmpty)
        } catch let error {
            print(error)
        }
        return result
    }
    
    private func updateHistoryStack(with currentOperator: String, and currentOperand: String) {
        historyStack.append(contentsOf: [currentOperator, currentOperand])
    }
    
    private func updateHistoryStackView(with currentOperator: String, and currentOperand: String) {
        let formulaStackView = createFormulaStackView(with: currentOperator, and: currentOperand)
        calculationHistoryStackView.addArrangedSubview(formulaStackView)
    }
    
    private func clearCalculationHistory() {
        removeFormulaStackViews()
    }
    
    private func clearHistoryStack() {
        historyStack.removeAll()
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
