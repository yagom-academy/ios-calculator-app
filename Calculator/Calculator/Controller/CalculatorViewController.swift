//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    
    var calculatorModel = Calculator()
    
    @IBOutlet weak var formulaHistoryStackView: UIStackView!
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        calculatorModel.touchAllClearButton()
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        calculatorModel.touchClearEntryButton()
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        calculatorModel.touchSignChangeButton()
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        calculatorModel.touchEqualButton()
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        calculatorModel.touchPointButton()
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpOperatorsButton(_ sender: UIButton) {
        guard let operatorSymbol = sender.titleLabel?.text else { return }
        calculatorModel.touchOperatorButton(operatorSymbol)
        updateCurrentInputLabel()
    }
    
    @IBAction func touchUpOperandsButton(_ sender: UIButton) {
        guard let operandSymbol = sender.titleLabel?.text else { return }
        calculatorModel.touchNumberButton(operandSymbol)
        updateCurrentInputLabel()
    }
    
    private func updateCurrentInputLabel() {
        currentInputOperandLabel.text = calculatorModel.currentInputOperand
        currentInputOperatorLabel.text = calculatorModel.currentInputOperator
    }
}
