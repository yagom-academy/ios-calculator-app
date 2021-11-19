//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    var expressionController: CalculatorExpressionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expressionController = CalculatorExpressionController()
    }
    
    // MARK: property
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
    
    @IBAction func clickAC(_ sender: UIButton) {
        removeExpression()
        setZeroInNumberLabel()
        
        expressionController?.expressionWrapperInit()
    }
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = operatorSettingLabel.text else {
            return
        }
        
        removeExpression()
        operatorSettingLabel.text = ""
        
        let formulaResult = expressionController?.calculate(expression: operatorOfButton +  numberOfLabel)
        numberCompositionLabel.text = formulaResult
    }
    
    @IBAction func initializationInputField(_ sender: UIButton) {
        setZeroInNumberLabel()
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        
        if numberOfLabel.isZeroValue {
            operatorSettingLabel.text = operatorOfButton
            return
        }
        
        if let stackView = expressionController?.addExpression(signValue: operatorSettingLabel.text, numberValue: numberOfLabel) {
            expressionView.addArrangedSubview(stackView)
        }
        
        operatorSettingLabel.text = operatorOfButton
        setZeroInNumberLabel()
    }
    
    @IBAction func clickNumberSign(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        if numberOfLabel.isZeroValue {
            return
        }
        
        numberCompositionLabel.text = expressionController?.changeNumberSign(numberValue: numberOfLabel)
    }
    
    @IBAction func clickDoubleZero(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let doubleZero = sender.titleLabel?.text else {
            return
        }
               
        if numberOfLabel.isZeroValue == false {
            numberCompositionLabel.text = numberOfLabel + doubleZero
        }
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if numberOfLabel.isZeroValue {
            numberCompositionLabel.text = numberOfButton
        } else {
            numberCompositionLabel.text = numberOfLabel + numberOfButton
        }
    }
    
    @IBAction func clickPoint(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let point = sender.titleLabel?.text else {
            return
        }
               
        if numberOfLabel.contains(point) == false {
            numberCompositionLabel.text = numberOfLabel + point
        }
    }
}

// MARK: - private method

extension CalculatorViewController {
    private func removeExpression() {
        expressionView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func setZeroInNumberLabel() {
        numberCompositionLabel.text = "0"
    }
}
