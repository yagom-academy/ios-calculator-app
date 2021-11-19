//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: private property
    
    private let currentLabelValue = CurrentLabelValue.shared
    
    private var expressionWrapper: String = ""
    
    // MARK: private outlet property
    
    @IBOutlet private weak var operandLabel: OperandLabel!
    @IBOutlet private weak var operatorLabel: OperatorLabel!
    
    @IBOutlet private weak var expressionView: UIStackView!
}

// MARK: - private computed property

extension CalculatorViewController {
    private var numberFormatter: Formatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp

        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }
}
 
// MARK: - private action method

extension CalculatorViewController {
    @IBAction private func clickNumber(_ sender: UIButton) {
        guard let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if currentLabelValue.operand == operandLabel.defaultValue {
            operandLabel.text = numberOfButton
        } else {
            operandLabel.text = currentLabelValue.operand + numberOfButton
        }
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
        guard let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        
        if currentLabelValue.operand == operandLabel.defaultValue {
            operatorLabel.text = operatorOfButton
            return
        }
        
        let stackView = createStackViewToAdd(signValue: currentLabelValue.operator, numberValue: currentLabelValue.operand)
        
        expressionView.addArrangedSubview(stackView)
        
        operatorLabel.text = operatorOfButton
        operandLabel.text = operandLabel.defaultValue
    }
    
    @IBAction private func clickEqual(_ sender: UIButton) {
        let stackView = createStackViewToAdd(signValue: currentLabelValue.operator, numberValue: currentLabelValue.operand)
        
        expressionView.addArrangedSubview(stackView)
        
        operatorLabel.text = operatorLabel.defaultValue
        operandLabel.text = calculateFormula()
    }
    
    @IBAction private func clickAllClear(_ sender: UIButton) {
        initExpressionWrapper()
        
        removeExpressionView()
        operandLabel.text = operandLabel.defaultValue
    }
    
    @IBAction private func clickClearExpression(_ sender: UIButton) {
        operandLabel.text = operandLabel.defaultValue
    }
    
    @IBAction private func clickNumberSign(_ sender: UIButton) {
        if currentLabelValue.operand == operandLabel.defaultValue {
            operandLabel.text = changeNumberSign(numberValue: operandLabel.emptyValue)
        } else {
            operandLabel.text = changeNumberSign(numberValue: currentLabelValue.operand)
        }
    }
    
    @IBAction private func clickDoubleZero(_ sender: UIButton) {
        guard let doubleZero = sender.titleLabel?.text else {
            return
        }
               
        if currentLabelValue.operand != operandLabel.defaultValue {
            operandLabel.text = currentLabelValue.operand + doubleZero
        }
    }
    
    @IBAction private func clickPoint(_ sender: UIButton) {
        guard let point = sender.titleLabel?.text else {
            return
        }
               
        if currentLabelValue.operand.contains(point) == false {
            operandLabel.text = currentLabelValue.operand + point
        }
    }
}

// MARK: - private method

extension CalculatorViewController {
    private func createStackViewToAdd(signValue: String?, numberValue: String) -> UIStackView {
        let expressionStackView = ExpressionStackView()
        
        expressionStackView.signLabel.text = signValue
        expressionStackView.numberLabel.text = numberValue
        
        setValueToExpressionWrapper(signValue, numberValue)
        
        return expressionStackView
    }
    
    private func removeExpressionView() {
        expressionView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func setValueToExpressionWrapper(_ signValue: String?, _ numberValue: String) {
        if let signValue = signValue {
            expressionWrapper += signValue + numberValue
        } else {
            expressionWrapper += numberValue
        }
    }
    
    private func initExpressionWrapper() {
        expressionWrapper = ""
    }
    
    private func changeNumberSign(numberValue: String) -> String {
        return numberValue.hasPrefix("-") ? numberValue.filter { $0.isNumber } : "-" + numberValue
    }
    
    private func calculateFormula() -> String? {
        var formula: Formula = ExpressionParser.parse(from: expressionWrapper)
        let calculatedValue: Decimal = Decimal(formula.result())
        
        initExpressionWrapper()
        
        return numberFormatter.string(for: calculatedValue)
    }
}
