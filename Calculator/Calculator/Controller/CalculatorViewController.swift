//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    var expressionController = CalculatorExpressionController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: property
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
    private var expression: String = ""
    
    @IBAction func clickAC(_ sender: UIButton) {
        removeExpression()
        expression = ""
    }
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = operatorSettingLabel.text else {
            return
        }
        expression += operatorOfButton + numberOfLabel
        
        var formula: Formula = ExpressionParser.parse(from: expression)
        let calculatedValue: Double = formula.result()
        
        removeExpression()
        expression = ""
        operatorSettingLabel.text = ""
        numberCompositionLabel.text = String(calculatedValue)
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
        
        expressionController.addExpression(signValue: operatorSettingLabel.text, numberValue: numberOfLabel)
        
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
        
        numberCompositionLabel.text = changeNumberSign(numberValue: numberOfLabel)
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
