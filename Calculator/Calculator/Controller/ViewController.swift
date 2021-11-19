//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var calculationHistoryScrollView: UIScrollView!
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    private var mathExpression = [String]()
    private var currentOperand: String = "0"
    private var currentOperator: String = ""
    
    private var isCalculated: Bool = false
        
    private let maximumDigitsOfDoubleExpression = 16
    private let limitedDigitsOfExpression = 20
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCurrentOperand()
    }

    // MARK: - Private Methods
    private func resetToInitialState() {
        mathExpression = [String]()
        currentOperator = ""
        operatorLabel.text = ""
        isCalculated = false
        
        resetCurrentOperand()
        
        calculationHistoryStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    private func resetCurrentOperand() {
        currentOperand = "0"
        operandLabel.text = "0"
    }
    
    private func splitWithIntegerAndFraction(from operand: String) -> (interger: String, fraction: String) {
        var integerDigits = operand
        var fractionDigits = ""
        
        if operand.contains(".") {
            let splited = operand.split(with: ".")
            integerDigits = splited.first ?? ""
            fractionDigits = splited.last ?? ""
        }
        
        return (integerDigits, fractionDigits)
    }
    
    private func changeOperator(to newOperator: String) {
        let operatorSymbols = Operator.allCases.map { $0.rawValue.description }
        
        guard let last = mathExpression.last else {
            return
        }
        
        if operatorSymbols.contains(last) {
            mathExpression.removeLast()
        }
        
        mathExpression.append(newOperator)
        operatorLabel.text = newOperator
        currentOperator = newOperator
    }
    
    private func isNumberOverMaximumExpression(number: Double) -> Bool {
        return abs(number) >= pow(10, Double(maximumDigitsOfDoubleExpression))
    }
    
    private func addLastCalculationHistory() {
        guard !currentOperand.isEmpty && !currentOperator.isEmpty else {
            return
        }
        
        guard let currentOperandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        guard let currentOperandNumber = Double(currentOperand) else {
            return
        }
        
        mathExpression.append(currentOperand)
        
        if isNumberOverMaximumExpression(number: currentOperandNumber) {
            addCalculationHistory(operandText: currentOperandNumber.description, operatorText: currentOperator)
        } else {
            addCalculationHistory(operandText: currentOperandText, operatorText: currentOperator)
        }
    }
    
    private func calculateFormula(from expression: [String]) {
        let formula = ExpressionParser.parse(from: expression.joined(separator: " "))
        
        do {
            let calculationResult = try formula.result()
            guard let calculationResultFormatted = calculationResult.description.addCommaOnEveryThreeDigits() else {
                return
            }
            
            operatorLabel.text = ""
            
            if isNumberOverMaximumExpression(number: calculationResult) {
                operandLabel.text = calculationResult.description
            } else {
                operandLabel.text = calculationResultFormatted
            }
        } catch OperationError.dividedByZero {
            operandLabel.text = "NaN"
            operatorLabel.text = ""
        } catch CalculationItemQueueError.hasNoElement {
            print(CalculationItemQueueError.hasNoElement.localizedDescription)
        } catch {
            print(error)
        }
    }
    
    private func addCalculationHistory(operandText: String, operatorText: String) {
        let selectedOperatorLabel = UILabel()
        selectedOperatorLabel.textColor = .white
        selectedOperatorLabel.text = operatorText
        selectedOperatorLabel.font = UIFont(name: "Helvetica", size: 24)
        
        let selectedOperandLabel = UILabel()
        selectedOperandLabel.textColor = .white
        selectedOperandLabel.text = operandText
        selectedOperandLabel.font = UIFont(name: "Helvetica", size: 24)
        
        let newHistoryStackView = UIStackView(arrangedSubviews: [selectedOperatorLabel, selectedOperandLabel])
        
        newHistoryStackView.axis = .horizontal
        newHistoryStackView.spacing = 10
        
        calculationHistoryStackView.addArrangedSubview(newHistoryStackView)
        
        autoScrollToBottom()
    }
    
    private func autoScrollToBottom() {
        calculationHistoryScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: calculationHistoryScrollView.contentSize.height - calculationHistoryScrollView.bounds.height + calculationHistoryScrollView.contentInset.bottom)
        
        if bottomOffset.y > 0 {
            calculationHistoryScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
}

// MARK: - IBAction Methods
extension ViewController {
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        if isCalculated {
            resetToInitialState()
        }
        
        guard let operand = sender.titleLabel?.text else {
            return
        }
                 
        guard currentOperand.count < limitedDigitsOfExpression else {
            return
        }
        
        if currentOperand == "0" {
            if !["0","00"].contains(operand) {
                currentOperand = operand
                operandLabel.text = currentOperand
            }
            return
        }
        
        currentOperand += operand
        
        guard let currentOperandNumber = Double(currentOperand) else {
            return
        }
        
        if isNumberOverMaximumExpression(number: currentOperandNumber) {
            operandLabel.text = currentOperandNumber.description
            return
        }
        
        let separatedCurrentOperand = splitWithIntegerAndFraction(from: currentOperand)
        
        guard let operandText = separatedCurrentOperand.interger.addCommaOnEveryThreeDigits() else {
            return
        }
                
        if separatedCurrentOperand.fraction.isEmpty {
            operandLabel.text = operandText
        } else {
            operandLabel.text = operandText + "." + separatedCurrentOperand.fraction
        }
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        guard !currentOperand.contains(dot) else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    @IBAction private func touchUpChangePlusMinusSign(_ sender: Any) {
        guard let currentOperandNumber = Double(currentOperand), !currentOperandNumber.isZero else {
            return
        }
        
        guard var operand = operandLabel.text else {
            return
        }
        
        if operand.contains("-") {
            operand.removeFirst()
        } else {
            operand = "-" + operand
        }
        
        operandLabel.text = operand
                
        guard isNumberOverMaximumExpression(number: currentOperandNumber) else {
            currentOperand = operand.replacingOccurrences(of: ",", with: "")
            return
        }
        
        if currentOperand.contains("-") {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "NaN" else {
            return
        }
        
        if isCalculated {
            resetCurrentOperand()
            isCalculated = false
        }
        
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
    
        guard let currentOperandNumber = Double(currentOperand), !currentOperandNumber.isZero else {
            changeOperator(to: `operator`)
            return
        }
        
        guard let operandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        if isNumberOverMaximumExpression(number: currentOperandNumber) {
            addCalculationHistory(operandText: currentOperandNumber.description, operatorText: currentOperator)
        } else {
            addCalculationHistory(operandText: operandText, operatorText: currentOperator)
        }
        
        mathExpression.append(currentOperand)
        mathExpression.append(`operator`)
        
        changeOperator(to: `operator`)        
        resetCurrentOperand()
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        guard !isCalculated else {
            return
        }
        
        isCalculated = true
        
        addLastCalculationHistory()
        calculateFormula(from: mathExpression)
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        resetToInitialState()
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        guard !isCalculated else {
            resetToInitialState()
            return
        }
        
        resetCurrentOperand()
    }
}
