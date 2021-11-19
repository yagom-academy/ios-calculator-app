//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expressionController = CalculatorExpressionController()
    }
    
    // MARK: property
    
    var expressionController: CalculatorExpressionController?
    let currentLabelValue = CurrentLabelValue.shared
    
    @IBOutlet weak var operandLabel: OperandLabel!
    @IBOutlet weak var operatorLabel: OperatorLabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
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
        
        if let stackView = expressionController?.addExpression(signValue: currentLabelValue.operator, numberValue: currentLabelValue.operand) {
            expressionView.addArrangedSubview(stackView)
        }
        
        operatorLabel.text = operatorOfButton
        operandLabel.text = operandLabel.defaultValue
    }
    
    @IBAction private func clickEqual(_ sender: UIButton) {
        guard let operatorOfLabel = operatorLabel.text else {
            return
        }
        
        operatorLabel.text = operatorLabel.defaultValue
        
        if let stackView = expressionController?.addExpression(signValue: operatorOfLabel, numberValue: currentLabelValue.operand) {
            expressionView.addArrangedSubview(stackView)
        }
    
        operandLabel.text = expressionController?.calculate()
    }
    
    @IBAction private func clickAllClear(_ sender: UIButton) {
        removeExpressionView()
        operandLabel.text = operandLabel.defaultValue
        
        expressionController?.expressionWrapperInit()
    }
    
    @IBAction private func clickClearExpression(_ sender: UIButton) {
        operandLabel.text = operandLabel.defaultValue
    }
    
    @IBAction private func clickNumberSign(_ sender: UIButton) {
        if currentLabelValue.operand == operandLabel.defaultValue {
            operandLabel.text = expressionController?.changeNumberSign(numberValue: "")
        } else {
            operandLabel.text = expressionController?.changeNumberSign(numberValue: currentLabelValue.operand)
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
    private func removeExpressionView() {
        expressionView.subviews.forEach{ $0.removeFromSuperview() }
    }
}

//signleton

class CurrentLabelValue {
    
    var operand: String
    var `operator`: String
    
    static var shared: CurrentLabelValue = {
        let instance = CurrentLabelValue()
        
        return instance
    }()
    
    private init() {
        operand = ""
        `operator` = ""
    }
}
