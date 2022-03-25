//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

fileprivate extension Constant {
    static let zero = "0"
    static let minus = "-"
    static let strangeMinus = "−"
    static let limitOperandCount = 20
}

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var calculationRecordScrollView: UIScrollView!
    @IBOutlet private weak var calculationRecordStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private var allButtonComponentExceptEqual: [UIButton]!
    
    // MARK: - Property
    private var currentOperand: String = Constant.zero
    private var currentOperator: String = Constant.blank
    private var expression = [String]()
    private enum CalculatorStatus {
        case nonCalculated
        case calculated
    }
    private var calculatorStatus: CalculatorStatus = .nonCalculated
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calculationRecordScrollView.scrollToBottom()
    }
}

// MARK: - IBAction
extension CalculatorViewController {
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        reconfigureCalculator()
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        reconfigureOperand()
    }
    
    @IBAction private func touchUpChangePlusMinusButton(_ sender: UIButton) {
        updatePlusMinusSign()
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        updateOperator(by: `operator`)
    }
    
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
        
        updateOperand(with: operand)
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        updateOperand(by: dot)
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        guard calculatorStatus == .nonCalculated else {
            return
        }
        
        calculatorStatus = .calculated
        updateLastCalculation()
    }
}

// MARK: - Update && Calculate Method
extension CalculatorViewController {
    private func updateOperand(with operand: String) {
        guard currentOperand.count < Constant.limitOperandCount else {
            return
        }
        
        if currentOperand.first?.description == Constant.zero && currentOperand.contains(Constant.dot) == false {
            currentOperand = operand
            operandLabel.text = currentOperand
            return
        }
                
        currentOperand += operand
        operandLabel.text = currentOperand.addedCommaToInteger()
    }
    
    private func updateOperand(by dot: String) {
        guard currentOperand.contains(dot) == false else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    private func updatePlusMinusSign() {
        guard operandLabel.text != Constant.zero,
              var operand = operandLabel.text else {
            return
        }
        
        if operand.contains(Constant.minus) {
            operand.removeFirst()
            currentOperand.removeFirst()
            operandLabel.text = operand
            return
        }
        
        if operand.contains(Constant.minus) == false {
            operand.insert(Character(Constant.minus), at: operand.startIndex)
            currentOperand.insert(Character(Constant.minus), at: operand.startIndex)
            operandLabel.text = operand
            return
        }
    }
    
    private func updateOperator(by operator: String) {
        guard operandLabel.text != Constant.zero else {
            operatorLabel.text = `operator`
            return
        }
        
        expression.append(currentOperand)
        expression.append(`operator`)
        
        updateCalculationRecord(with: currentOperand, currentOperator)
        
        currentOperator = `operator`
        operatorLabel.text = `operator`
        reconfigureOperand()
    }
    
    private func updateCalculationRecord(with operand: String, _ operator: String) {
        if calculationRecordStackView.subviews.count == .zero {
            let ExpressionStackView = ExpressionStackView(operand: operand)
            calculationRecordStackView.addArrangedSubview(ExpressionStackView)
            return
        }
        
        let ExpressionStackView = ExpressionStackView(operator: `operator`, operand: operand)
        calculationRecordStackView.addArrangedSubview(ExpressionStackView)
    }
    
    private func updateLastCalculation() {
        expression.append(currentOperand)
        updateCalculationRecord(with: currentOperand, currentOperator)
        
        calculate()
    }
    
    private func calculate() {
        var formula = ExpressionParser.parse(from: expression
            .joined(separator: Constant.whiteSpace)
            .replacingOccurrences(of: Constant.strangeMinus, with: Constant.minus))
        
        do {
            let result = try formula.result()
            updateCalculateResult(by: result)
        } catch (let error) {
            handle(error: error)
        }
    }
    
    private func updateCalculateResult(by result: Double) {
        if currentOperand.contains(Constant.dot) {
            operandLabel.text = result.description.addedCommaToInteger()
        }
        
        if currentOperand.contains(Constant.dot) == false {
            let convertedDoubleToInt = Int(result)
            operandLabel.text = convertedDoubleToInt.description.addedCommaToInteger()
        }
        
        reconfigureOperator()
        configureAllButton()
    }
}

// MARK: - Configure Method
extension CalculatorViewController {
    private func reconfigureCalculator() {
        calculatorStatus = .nonCalculated
        expression = [String]()
        reconfigureOperand()
        reconfigureOperator()
        calculationRecordStackView
            .arrangedSubviews
            .forEach { $0.removeFromSuperview() }
    }
    
    private func reconfigureOperand() {
        currentOperand = Constant.zero
        operandLabel.text = Constant.zero
    }
    
    private func reconfigureOperator() {
        currentOperator = Constant.blank
        operatorLabel.text = Constant.blank
    }
}

// MARK: - Button Configure Method
extension CalculatorViewController {
    private func configureAllButton() {
        allButtonComponentExceptEqual.forEach {
            $0.addTarget(self, action: #selector(reconfigureAction(sender:)), for: .touchUpInside)
        }
    }

    @objc private func reconfigureAction(sender: UIButton) {
        if calculatorStatus == .calculated {
            reconfigureCalculator()
        }
    }
}

// MARK: - Error Handle Method
extension CalculatorViewController {
    private func handle(error: Error) {
        if let calculatorError = error as? CalculatorError {
            handle(calculatorError: calculatorError)
        }
        
        if let queueError = error as? QueueError {
            handle(queueError: queueError)
        }
    }
    
    private func handle(calculatorError: CalculatorError) {
        if case .dividedByZero = calculatorError,
           let errorDescription = calculatorError.errorDescription {
            operandLabel.text = errorDescription
            operatorLabel.text = Constant.blank
        }
    }
    
    private func handle(queueError: QueueError) {
        if case .notFoundElement = queueError,
            let errorDescription = queueError.errorDescription {
            assertionFailure(errorDescription)
        }
    }
}

