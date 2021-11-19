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
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
}
 
// MARK: - private action method

extension CalculatorViewController {
    @IBAction private func clickAllClear(_ sender: UIButton) {
        removeExpressionView()
        setZeroInNumberLabel()
        
        expressionController?.expressionWrapperInit()
    }
    
    @IBAction private func clickEqual(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfLabel = operatorSettingLabel.text else {
            return
        }
        
        setNilInOperatorLabel()
        
        if let stackView = expressionController?.addExpression(signValue: operatorOfLabel, numberValue: numberOfLabel) {
            expressionView.addArrangedSubview(stackView)
        }
    
        numberCompositionLabel.text = expressionController?.calculate()
    }
    
    @IBAction private func clickClearExpression(_ sender: UIButton) {
        setZeroInNumberLabel()
    }
    
    @IBAction private func clickOperator(_ sender: UIButton) {
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
    
    @IBAction private func clickNumberSign(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        if numberOfLabel.isZeroValue {
            numberCompositionLabel.text = expressionController?.changeNumberSign(numberValue: "")
        } else {
            numberCompositionLabel.text = expressionController?.changeNumberSign(numberValue: numberOfLabel)
        }
    }
    
    @IBAction private func clickDoubleZero(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let doubleZero = sender.titleLabel?.text else {
            return
        }
               
        if numberOfLabel.isZeroValue == false {
            numberCompositionLabel.text = numberOfLabel + doubleZero
        }
    }
    
    @IBAction private func clickNumber(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if numberOfLabel.isZeroValue {
            numberCompositionLabel.text = numberOfButton
        } else {
            numberCompositionLabel.text = numberOfLabel + numberOfButton
        }
    }
    
    @IBAction private func clickPoint(_ sender: UIButton) {
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
