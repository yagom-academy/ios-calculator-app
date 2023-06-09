//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var formula: String = ""
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 10
        numberFormatter.maximumIntegerDigits = 20
        
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
        
        return numberFormatter.string(for: parsedFormula.result())
    }
    
    private func addFormula() {
        guard let operands = operandsLabel.text,
              let `operator` = operatorLabel.text else { return }
        
        if formula.isEmpty && operands != CalculatorTerms.zero.rawValue  {
            formula += "\(operands) "
            addCalculationDetailsStackView("", operands)
        } else if operands != CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(operands) "
            addCalculationDetailsStackView(`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(operands) "
        }
        
        clearOperatorLabel()
        clearOperandsLabel()
    }
    
    private func addOperandsLabel(_ input: String) {
        guard let operands = operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let num = Double(operands + input),
              let result = numberFormatter.string(for: num) else { return }
        
        if operands.contains(CalculatorTerms.decimalPoint.rawValue) && (input == CalculatorTerms.zero.rawValue || input == CalculatorTerms.doubleZero.rawValue) {
            let result = operands + input
            setOperandsLabel(result)
            return
        } else if !operands.contains(CalculatorTerms.decimalPoint.rawValue) && input == CalculatorTerms.decimalPoint.rawValue {
            let result = operands + input
            setOperandsLabel(result)
            return
        }
        
        setOperandsLabel(result)
    }
    
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "\(`operator`) \(operands)"
        
        calculationDetailsStackView.addArrangedSubview(label)
        calculationDetailsScrollView.scrollToBottom(animated: false)
    }
    
    private func changeSign() {
        guard var operands = operandsLabel.text else { return }
        
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

