//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

fileprivate extension Const {
    static let zero = "0"
    static let minus = "-"
    static let strangeMinus = "−"
    static let limitOperandCount = 20
}

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var topRecordScrollView: UIScrollView!
    @IBOutlet private weak var topRecordStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var blockScreenView: UIView!
    
    // MARK: - Property
    private var currentOperand: String = Const.zero
    private var currentOperator: String = Const.blank
    private var expression = [String]()
    private enum Status {
        case nonCalculated
        case calculated
    }
    private var status: Status = .nonCalculated
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
    }
}

// MARK: - View Tap Gesture Recognizer
extension CalculatorViewController: UIGestureRecognizerDelegate {
    private func addTapGesture() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        blockScreenView.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if blockScreenView.isHidden == false {
            resetCalculator()
            blockScreenView.isHidden = true
        }
        
        return true
    }
}

// MARK: - When touch up AC Button
extension CalculatorViewController {
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    private func resetCalculator() {
        status = .nonCalculated
        expression = [String]()
        resetOperand()
        resetOperator()
        topRecordStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

// MARK: - When touch up CE Button
extension CalculatorViewController {
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetOperand()
    }
    
    private func resetOperand() {
        currentOperand = Const.zero
        operandLabel.text = Const.zero
    }
}

// MARK: - When touch up ChangePlusMinus Button
extension CalculatorViewController {
    @IBAction private func touchUpChangePlusMinusButton(_ sender: UIButton) {
        updatePlusMinusSign()
    }
    
    private func updatePlusMinusSign() {
        guard operandLabel.text != Const.zero else { return }
        guard var operand = operandLabel.text else { return }
        
        func deleteMinus() {
            operand.removeFirst()
            currentOperand.removeFirst()
            operandLabel.text = operand
        }
        
        func addMinus() {
            operand.insert(Character(Const.minus), at: operand.startIndex)
            currentOperand.insert(Character(Const.minus), at: operand.startIndex)
            operandLabel.text = operand
        }
                
        if operand.contains(Const.minus) {
            deleteMinus()
        } else {
            addMinus()
        }
    }
}

// MARK: - When touch up Operator Button
extension CalculatorViewController {
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        updateOperator(by: `operator`)
    }
    
    private func updateOperator(by operator: String) {
        guard operandLabel.text != Const.zero else {
            operatorLabel.text = `operator`
            return
        }
        expression.append(currentOperand)
        expression.append(`operator`)
        updateRecord(operand: currentOperand, operator: currentOperator)
        currentOperator = `operator`
        operatorLabel.text = `operator`
        resetOperand()
    }
}

// MARK: - When touch up Operand Button
extension CalculatorViewController {
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
        updateOperand(with: operand)
    }
    
    private func updateOperand(with operand: String) {
        if currentOperand.count > Const.limitOperandCount { return }
        
        func isValid() -> Bool { currentOperand.first == Const.zero && currentOperand.contains(Const.dot) == false }
        
        if isValid() {
            currentOperand = operand
            operandLabel.text = currentOperand
        } else {
            currentOperand += operand
            operandLabel.text = currentOperand.toDecimal()
        }
    }
}

// MARK: - When touch up Dot Button
extension CalculatorViewController {
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        updateOperand(by: Const.dot)
    }
    
    private func updateOperand(by dot: String) {
        guard currentOperand.contains(dot) == false else {
            return
        }
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
}

// MARK: - When touch up Equal Button
extension CalculatorViewController {
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        guard status == .nonCalculated else {
            return
        }
        status = .calculated
        updateLastCalculation()
    }
    
    private func updateLastCalculation() {
        expression.append(currentOperand)
        updateRecord(operand: currentOperand, operator: currentOperator)
        calculate()
    }
    
    private func updateRecord(operand: String, operator: String) {
        if topRecordStackView.subviews.count == .zero {
            let stackView = ExpressionStackView(operand: operand)
            topRecordStackView.addArrangedSubview(stackView)
            return
        }
        let stackView = ExpressionStackView(operator: `operator`, operand: operand)
        topRecordStackView.addArrangedSubview(stackView)
        topRecordScrollView.scrollToBottom()
    }
    
    private func calculate() {
        var formula = ExpressionParser.parse(from: expression
            .joined(separator: Const.whiteSpace)
            .replacingOccurrences(of: Const.strangeMinus, with: Const.minus))
        
        do {
            let result = try formula.result()
            updateResult(by: result)
        } catch (let error) {
            handle(error: error)
        }
    }
    
    private func updateResult(by result: Double) {
        if currentOperand.contains(Const.dot) {
            operandLabel.text = result
                .description
                .toDecimal()
        } else {
            operandLabel.text = Int(result)
                .description
                .toDecimal()
        }
        resetOperator()
        blockScreenView.isHidden = false
    }
    
    private func resetOperator() {
        currentOperator = Const.blank
        operatorLabel.text = Const.blank
    }
    
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
            operatorLabel.text = Const.blank
        }
    }
    
    private func handle(queueError: QueueError) {
        if case .notFoundElement = queueError,
            let errorDescription = queueError.errorDescription {
            assertionFailure(errorDescription)
        }
    }
}

