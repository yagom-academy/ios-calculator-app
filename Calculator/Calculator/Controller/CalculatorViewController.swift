//
//  Calculator - CalculatorViewController.swift
//  Created by Brad.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var firstNumberLable: UILabel!
    @IBOutlet weak var secondNumberLable: UILabel!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var secondOperatorLabel: UILabel!
    
    @IBOutlet weak var previousValues: UIScrollView!
    @IBOutlet weak var valuesStackView: UIStackView!
    
    let numberFormatter = NumberFormatter()
    var calculatorModel = CalculatorModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultLabels()
        settingNumberFormaatter()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        let operand: String = calculatorModel.addOperand(to: buttonTitle)
        numberLabel.text = operand
    }

    private func defaultLabels() {
        numberLabel.text = "0"
        operatorLabel.text = ""
        firstNumberLable.removeFromSuperview()
        secondNumberLable.removeFromSuperview()
        firstOperatorLabel.removeFromSuperview()
        secondOperatorLabel.removeFromSuperview()
    }

    private func settingNumberFormaatter() {
        numberFormatter.roundingMode = .floor
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 3
    }
}
