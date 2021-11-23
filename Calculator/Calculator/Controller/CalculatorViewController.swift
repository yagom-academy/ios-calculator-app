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
        
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        calculatorModel.touchAllClearButton()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        calculatorModel.touchClearEntryButton()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        calculatorModel.touchSignChangeButton()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        calculatorModel.touchEqualButton()
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        calculatorModel.touchPointButton()
    }
    
    @IBAction func touchUpOperatorsButton(_ sender: UIButton) {
        guard let operatorSymbol = sender.titleLabel?.text else { return }
        calculatorModel.touchOperatorButton(operatorSymbol)
    }
    
    @IBAction func touchUpOperandsButton(_ sender: UIButton) {
        guard let operandSymbol = sender.titleLabel?.text else { return }
        calculatorModel.touchNumberButton(operandSymbol)
    }
    
}
