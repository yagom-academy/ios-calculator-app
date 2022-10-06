//
//  CalculatorViewController.swift
//  Created by 미니, SummerCat.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var parentLogStackView: UIStackView!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private var calculatorButtons: [UIButton]!

    private var expression: String = ""
    private var currentNumber: String = ""
    private var currentOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitState()
    }
    
    @IBAction private func didTappedNumberButton(_ sender: UIButton) {
        let inputNumber = sender.tag.description
        currentNumber.append(inputNumber)
        updateNumberLabels()
    }
    
    @IBAction private func didTappedDoubleZeroButton(_ sender: UIButton) {
        currentNumber.append(Constant.Calculator.doubleZero)
        updateNumberLabels()
    }
    
    @IBAction private func didTappedDivideButton(_ sender: UIButton) {
        updateExpression(symbol: Constant.Calculator.divideSymbol)
    }
    
    @IBAction private func didTappedMultiplyButton(_ sender: UIButton) {
        updateExpression(symbol: Constant.Calculator.multiplySymbol)
    }
    
    @IBAction private func didTappedSubtractButton(_ sender: UIButton) {
        updateExpression(symbol: Constant.Calculator.minusSymbol)
    }
    
    @IBAction private func didTappedAddButton(_ sender: UIButton) {
        updateExpression(symbol: Constant.Calculator.plusSymbol)
    }
    
    @IBAction private func didTappedEqualButton(_ sender: UIButton) {
        guard currentNumber.isNotEmpty else { return }
        
        expression.append(currentOperator)
        expression.append(currentNumber)
        
        addChildLogStackView()
        
        resetCurrentCalculatorState()
        resetOperatorLabel()
        
        calculateExpression()
        
        toggleButtonState()
    }
    
    @IBAction private func didTappedACButton(_ sender: UIButton) { resetInitState() }
    
    @IBAction private func didTappedCEButton(_ sender: UIButton) {
        guard calculatorButtons.allSatisfy(\.isEnabled) else {
            resetInitState()
            return
        }
        
        resetCurrentNumber()
        resetNumberLabel()
    }
    
    @IBAction private func didTappedDecimalButton(_ sender: UIButton) {
        guard let currentNumberText = currentNumberLabel.text,
              !currentNumberText.contains(Constant.Calculator.decimalPoint) else { return }
        
        currentNumberLabel.text = currentNumberText + Constant.Calculator.decimalPoint
        currentNumber.append(Constant.Calculator.decimalPoint)
    }
    
    @IBAction private func didTappedConvertSign(_ sender: UIButton) {
        guard currentNumber.isNotEmpty else {
            return
        }
        
        if currentNumber.first?.description == Constant.Calculator.minusSymbol {
            currentNumber.removeFirst()
        } else {
            currentNumber.insert(
                Character(Constant.Calculator.minusSymbol),
                at: currentNumber.startIndex
            )
        }
        
        updateNumberLabelTo(number: currentNumber)
    }
    
    private func updateExpression(symbol: String) {
        guard currentNumber.isNotEmpty else {
            currentOperator = symbol
            updateOperatorLabel()
            return
        }
        
        expression.append(currentOperator)
        expression.append(currentNumber)
        
        addChildLogStackView()
        
        currentOperator = symbol
        currentNumber = Constant.Calculator.empty
        
        resetNumberLabel()
        updateOperatorLabel()
    }
}

// MARK: - CalculatorLogDelegate 관련 메서드
extension CalculatorViewController: CalculatorLogDelegate {
    func willShowLogStackView(
        stackView: UIStackView,
        operatorLabel: UILabel,
        operandLabel: UILabel
    ) {
        let operatorValue = currentOperator.isEmpty ? Constant.Calculator.empty : currentOperator
        operatorLabel.text = operatorValue
        operandLabel.text = currentNumber.toFormattedString()
    }
}

// MARK: - StackView UI변경 관련 메서드
private extension CalculatorViewController {
    func addChildLogStackView() {
        let childView = CalculatorLogStackView()
        childView.delegate = self
        childView.configureStackView()
        
        parentLogStackView.addArrangedSubview(childView)
        scrollView.scrollToBottom(animated: true)
    }
}

// MARK: - 계산기 사용자 입력 상태 관리 메서드
private extension CalculatorViewController {
    func setUpInitState() {
        currentNumberLabel.text = Constant.Calculator.defaultNumber
        currentOperatorLabel.text = Constant.Calculator.empty
    }
    
    func resetInitState() {
        resetLabels()
        resetCurrentCalculatorState()
        resetExpression()
        parentLogStackView.removeAllSubviews()
        toggleButtonState()
    }
    
    func resetCurrentCalculatorState() {
        resetCurrentNumber()
        resetCurrentOperator()
    }
    
    func resetCurrentNumber() {
        currentNumber = Constant.Calculator.empty
    }
    
    func resetCurrentOperator() {
        currentOperator = Constant.Calculator.empty
    }
    
    func resetExpression() {
        expression = Constant.Calculator.empty
    }
    
    func toggleButtonState() {
        calculatorButtons.forEach { $0.isEnabled.toggle() }
    }
    
    func calculateExpression() {
        var formula = ExpressionParser.parse(from: expression)
        expression = Constant.Calculator.empty
        
        guard let result = formula.result() else {
            return
        }
        
        if result.isNaN {
            updateNumberLabelTo(number: Constant.Calculator.nan)
        } else {
            updateNumberLabelTo(number: result.description.toFormattedString())
        }
    }
}

// MARK: - 뷰 관련 메서드
private extension CalculatorViewController {
    func resetLabels() {
        resetNumberLabel()
        resetOperatorLabel()
    }
    
    func resetNumberLabel() {
        currentNumberLabel.text = Constant.Calculator.defaultNumber
    }
    
    func resetOperatorLabel() {
        currentOperatorLabel.text = Constant.Calculator.empty
    }
    
    func updateNumberLabelTo(number: String?) {
        currentNumberLabel.text = number
    }
    
    func updateOperatorLabel() {
        currentOperatorLabel.text = currentOperator
    }
    
    func updateNumberLabels() {
        if currentNumber.contains(Constant.Calculator.decimalPoint) {
            updateNumberLabelTo(number: currentNumber)
        } else {
            updateNumberLabelTo(number: currentNumber.toFormattedString())
        }
    }
}

// MARK: - String Extension 관련 메서드
private extension String {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
