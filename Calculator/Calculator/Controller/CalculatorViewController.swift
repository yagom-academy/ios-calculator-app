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
    
    @IBOutlet weak var numberCompositionLabel: NumberCompositionLabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
    let currentLabelValue = CurrentLabelValue.shared
}
 
// MARK: - private action method

extension CalculatorViewController {
    @IBAction private func clickNumber(_ sender: UIButton) {
        guard let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if currentLabelValue.operand.isZeroValue {
            numberCompositionLabel.text = numberOfButton
        } else {
            numberCompositionLabel.text = currentLabelValue.operand + numberOfButton
        }
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
        guard let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        
        if currentLabelValue.operand.isZeroValue {
            operatorSettingLabel.text = operatorOfButton
            return
        }
        
        if let stackView = expressionController?.addExpression(signValue: operatorSettingLabel.text, numberValue: currentLabelValue.operand) {
            expressionView.addArrangedSubview(stackView)
        }
        
        operatorSettingLabel.text = operatorOfButton
        setZeroInNumberLabel()
    }
    
    @IBAction private func clickEqual(_ sender: UIButton) {
        guard let operatorOfLabel = operatorSettingLabel.text else {
            return
        }
        
        setNilInOperatorLabel()
        
        if let stackView = expressionController?.addExpression(signValue: operatorOfLabel, numberValue: currentLabelValue.operand) {
            expressionView.addArrangedSubview(stackView)
        }
    
        numberCompositionLabel.text = expressionController?.calculate()
    }
    
    @IBAction private func clickAllClear(_ sender: UIButton) {
        removeExpressionView()
        setZeroInNumberLabel()
        
        expressionController?.expressionWrapperInit()
    }
    
    @IBAction private func clickClearExpression(_ sender: UIButton) {
        setZeroInNumberLabel()
    }
    
    @IBAction private func clickNumberSign(_ sender: UIButton) {
        if currentLabelValue.operand.isZeroValue {
            numberCompositionLabel.text = expressionController?.changeNumberSign(numberValue: "")
        } else {
            numberCompositionLabel.text = expressionController?.changeNumberSign(numberValue: currentLabelValue.operand)
        }
    }
    
    @IBAction private func clickDoubleZero(_ sender: UIButton) {
        guard let doubleZero = sender.titleLabel?.text else {
            return
        }
               
        if currentLabelValue.operand.isZeroValue == false {
            numberCompositionLabel.text = currentLabelValue.operand + doubleZero
        }
    }
    
    @IBAction private func clickPoint(_ sender: UIButton) {
        guard let point = sender.titleLabel?.text else {
            return
        }
               
        if currentLabelValue.operand.contains(point) == false {
            numberCompositionLabel.text = currentLabelValue.operand + point
        }
    }
}

// MARK: - private method

extension CalculatorViewController {
    private func removeExpressionView() {
        expressionView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func setZeroInNumberLabel() {
        numberCompositionLabel.text = "0"
    }
    
    private func setNilInOperatorLabel() {
        operatorSettingLabel.text = nil
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
