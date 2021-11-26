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
    private let zeroString = "0"
    private let emptyString = ""
    
    var calculator: Calculatable!
    var numberFormatter: CustomNumberFormatter!
    
    private var currentOperandLabelText: String {
        get {
            return currentOperandLabel.text ?? zeroString
        }
        set {
            currentOperandLabel.text = newValue
        }
    }
    
    private var isZeroDuringInput: Bool {
        return calculator.currentOperandIsZero && calculator.historyStackIsNotEmpty
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaStackViews()
        updateCurrentOperandValueAndLabel(to: zeroString)
        updateCurrentOperatorValueAndLabel(to: emptyString)
    }
    
    //MARK: - @IBAction Methods
    @IBAction private func touchUpDigitButton(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        let newOperand = calculator.currentOperand + numberPressedString
        do {
            guard let formattedOperand = try numberFormatter.convertStringToPresentableFormat(from: newOperand) else {
                return
            }
            calculator.updateCurrentOperandValue(to: newOperand)
            update(currentOperandLabel, to: formattedOperand)
        } catch let error as NumberFormatError {
            print(error.errorDescription)
        } catch {
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
        if calculator.currentOperandIsNotZero {
            updateHistoryStackView(with: calculator.currentOperator, and: currentOperandLabelText)
            calculator.updateFormulaList()
            updateCurrentOperatorValueAndLabel(to: operatorPressedString)
            updateCurrentOperandValueAndLabel(to: zeroString)
            autoScrollToBottom()
        }
    }
    
    @IBAction private func touchUpCalculateButton(_ sender: Any) {
        calculator.updateFormulaList()
        updateHistoryStackView(with: calculator.currentOperator, and: currentOperandLabelText)
        
        let result = calculator.calculateResult()
        do {
            if let presentableResult = try numberFormatter.convertToPresentableFormat(from: result) {
                update(currentOperandLabel, to: presentableResult)
            }
        } catch let error as NumberFormatError{
            print(error.errorDescription)
        } catch {
            print(error)
        }
        calculator.updateCurrentOperandValue(to: result.convertToString)
        updateCurrentOperatorValueAndLabel(to: emptyString)
        calculator.clearHistoryStack()
        autoScrollToBottom()
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        removeFormulaStackViews()
        calculator.clearHistoryStack()
        updateCurrentOperandValueAndLabel(to: zeroString)
        updateCurrentOperatorValueAndLabel(to: emptyString)
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        updateCurrentOperandValueAndLabel(to: zeroString)
    }
    
    @IBAction private func touchUpSignButton(_ sender: Any) {
        guard calculator.currentOperandIsNotZero,
              let doubleOperand = Double(calculator.currentOperand),
              doubleOperand != 0 else {
            return
        }
        do {
            let toggledOperand = doubleOperand * -1
            guard let newOperand = try numberFormatter.convertToPresentableFormat(from: toggledOperand) else {
                return
            }
            updateCurrentOperandValueAndLabel(to: newOperand)
        } catch let error as NumberFormatError{
            print(error.errorDescription)
        } catch {
            print(error)
        }
    }
}

extension CalculatorViewController {
    // MARK: - Methods
    private func removeFormulaStackViews() {
        calculationHistoryStackView.arrangedSubviews
            .forEach { $0.removeFromSuperview() }
    }
    
    private func updateCurrentOperandValueAndLabel(to newOperand: String) {
        calculator.updateCurrentOperandValue(to: newOperand)
        update(currentOperandLabel, to: newOperand)
    }
    
    private func updateCurrentOperatorValueAndLabel(to newOperator: String) {
        calculator.updateCurrentOperatorValue(to: newOperator)
        update(currentOperatorLabel, to: newOperator)
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
    
    private func updateHistoryStackView(with currentOperator: String, and currentOperand: String) {
        let formulaStackView = createFormulaStackView(with: currentOperator, and: currentOperand)
        calculationHistoryStackView.addArrangedSubview(formulaStackView)
    }
    
    private func createFormulaStackView(with currentOperator: String, and currentOperand: String) -> UIStackView {
        let formulaStackView = createStackView()
        let operandLabel = createLabel(with: currentOperand)
        let operatorLabel = createLabel(with: currentOperator)
        
        if calculationHistoryStackView.arrangedSubviews.isEmpty {
            formulaStackView.addArrangedSubview(operandLabel)
            return formulaStackView
        }
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        
        return formulaStackView
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        let spacingConstant = 8.0
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat(spacingConstant)
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
