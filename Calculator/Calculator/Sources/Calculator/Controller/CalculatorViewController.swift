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
        updateNumberLabelWith(originalNumber: currentNumber)
    }
    
    @IBAction private func didTappedDoubleZeroButton(_ sender: UIButton) {
        currentNumber.append(Constant.Calculator.doubleZero)
        updateNumberLabelWith(originalNumber: currentNumber)
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
        
        resetCurrentNumber()
        resetCurrentOperator()
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
        
        updateNumberLabelWith(originalNumber: currentNumber)
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

// MARK: - StackView UI변경 관련 메서드
private extension CalculatorViewController {
    func addChildLogStackView() {
        let operatorValue = currentOperator.isEmpty ? Constant.Calculator.empty : currentOperator
        
        let childView = CalculatorLogStackView(operatorText: operatorValue, operandText: currentNumber.formatNumber())
        
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
        resetNumberLabel()
        resetOperatorLabel()
        resetCurrentNumber()
        resetCurrentOperator()
        resetExpression()
        parentLogStackView.removeAllSubviews()
        toggleButtonState()
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
            currentNumberLabel.text = Constant.Calculator.nan
        } else {
            updateNumberLabelWith(originalNumber: result.description)
        }
    }
}

// MARK: - 뷰 관련 메서드
private extension CalculatorViewController {
    func resetNumberLabel() {
        currentNumberLabel.text = Constant.Calculator.defaultNumber
    }
    
    func resetOperatorLabel() {
        currentOperatorLabel.text = Constant.Calculator.empty
    }
    
    func updateOperatorLabel() {
        currentOperatorLabel.text = currentOperator
    }
    
    func updateNumberLabelWith(originalNumber: String) {
        let labelText = originalNumber.contains(Constant.Calculator.decimalPoint) ? originalNumber : originalNumber.formatNumber()
        currentNumberLabel.text = labelText
    }
}

// MARK: - String Extension 관련 메서드
private extension String {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
