//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var temporaryOperandText: String = ""
    private var confirmedFormula: [String] = []
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func isValidTemporaryOperandTextDigitsLessFifteenCount() -> Bool {
        if temporaryOperandText.count > 15 {
            return false
        }
        return true
    }
        
    private func isValidZeroForTemporaryOperandText(inputText: String) -> Bool {
        guard operandsLabel.text == CalculatorEtc.singleZero else { return true }
        if inputText == CalculatorEtc.singleZero || inputText == CalculatorEtc.doubleZero {
            return false
        }
        return true
    }
    
    private func updateTemporaryOperandTextAndOperandsLabel(by inputText: String) {
        if operandsLabel.text == "0" {
            temporaryOperandText = inputText
            operandsLabel.text = temporaryOperandText
        }
    }
    
    @IBAction func didTapOperandButtons(_ sender: UIButton) {
        guard let operandButtonLabelText = sender.titleLabel?.text else {
            return
        }
        guard isValidTemporaryOperandTextDigitsLessFifteenCount() else {
            return
        }
        guard isValidZeroForTemporaryOperandText(inputText: operandButtonLabelText) else {
            return
        }
        updateTemporaryOperandTextAndOperandsLabel(by: operandButtonLabelText)
    }
}
