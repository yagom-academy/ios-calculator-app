//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var formula: String = ""
    private var isCalculate: Bool = false
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.maximumIntegerDigits = 12
        
        return numberFormatter
    }()
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var calculationDetailsStackView: UIStackView!
    @IBOutlet private weak var calculationDetailsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearOperatorLabel()
        clearOperandsLabel()
        clearCalculationDetailsStackView()
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
        
        addFormula()
        setOperatorLabel(inputOperator)
    }
    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        addFormula()
        
        guard let result = calculateFormula() else { return }
        
        setOperandsLabel(result)
        clearFormula()
        clearCalculationDetailsStackView()
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        addOperandsLabel(inputNumber)
    }
    
    @IBAction private func tapFunctionButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case CalculatorTerms.allClear.rawValue:
            clearOperatorLabel()
            clearOperandsLabel()
            clearFormula()
            clearCalculationDetailsStackView()
        case CalculatorTerms.clearEntry.rawValue:
            clearOperandsLabel()
        case CalculatorTerms.changeSign.rawValue:
            changeSign()
        default:
            break
        }
    }
    
    private func calculateFormula() -> String? {
        var parsedFormula = ExpressionParser.parse(from: formula)
        let result = numberFormatter.string(for: parsedFormula.result())
        isCalculate = true
        
        return result
    }
    
    private func addFormula() {
        guard let currentOperands = operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let number = Double(currentOperands),
              let operands = numberFormatter.string(for: number),
              let `operator` = operatorLabel.text else { return }
        
        if formula.isEmpty && operands != CalculatorTerms.zero.rawValue  {
            formula += "\(number) "
            addCalculationDetailsStackView("", operands)
        } else if operands != CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(number) "
            addCalculationDetailsStackView(`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(operands) "
        }
        
        clearOperatorLabel()
        clearOperandsLabel()
    }
    
    private func addOperandsLabel(_ input: String) {
        guard let currentOperands = isCalculate ? CalculatorTerms.zero.rawValue : operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let number = Double(currentOperands + input),
              let operands = numberFormatter.string(for: number) else { return }
        
        if operands.filter({ $0 == "," }).count == 4 || currentOperands.count >= 13 {
            return
        }
        
        if currentOperands.contains(CalculatorTerms.decimalPoint.rawValue) && (input == CalculatorTerms.zero.rawValue || input == CalculatorTerms.doubleZero.rawValue) {
            let result = currentOperands + input
            setOperandsLabel(result)
            return
        } else if !currentOperands.contains(CalculatorTerms.decimalPoint.rawValue) && input == CalculatorTerms.decimalPoint.rawValue {
            let result = operands + input
            setOperandsLabel(result)
            return
        }
        
        isCalculate = false
        setOperandsLabel(operands)
    }
    
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "\(`operator`) \(operands)"
        
        calculationDetailsStackView.addArrangedSubview(label)
        calculationDetailsScrollView.layoutIfNeeded()
        calculationDetailsScrollView.scrollToBottom(animated: false)
    }
    
    private func changeSign() {
        guard var operands = operandsLabel.text, operands != CalculatorTerms.zero.rawValue else { return }
        
        if operands.contains(CalculatorTerms.minusSign.rawValue) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorTerms.minusSign.rawValue), at: operands.startIndex)
        }
        
        setOperandsLabel(operands)
    }
    
    private func setOperatorLabel(_ data: String) {
        operatorLabel.text = data
    }
    
    private func setOperandsLabel(_ data: String) {
        operandsLabel.text = data
    }
    
    private func clearOperatorLabel() {
        operatorLabel.text?.removeAll()
    }
    
    private func clearOperandsLabel() {
        operandsLabel.text = CalculatorTerms.zero.rawValue
    }
    
    private func clearCalculationDetailsStackView() {
        calculationDetailsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearFormula() {
        formula.removeAll()
    }
}

