//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    private var temporaryOperandText: String = CalculatorNameSpace.emptyStateString
    private var confirmedFormula: [String] = []
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCalculatorHistory()
    }
    
    private func initializeCalculatorHistory() {
        operandsLabel.text = CalculatorNameSpace.singleZero
        operatorsLabel.text = CalculatorNameSpace.emptyStateString
    }
    
    @IBAction func didTapOperandButtons(_ sender: UIButton) {
        guard let operandButtonLabelText = sender.titleLabel?.text else {
            return
        }
        guard isValidTemporaryOperandTextDigitsLessFifteenCount() else {
            return
        }
        guard isValidFirstInputNonZero(inputText: operandButtonLabelText) else {
            return
        }
        updateTemporaryOperandTextAndOperandsLabel(by: operandButtonLabelText)
    }
}

// MARK: - didTapOperandButtons 관련 메서드

extension CalculatorViewController {
    private func isValidTemporaryOperandTextDigitsLessFifteenCount() -> Bool {
        if temporaryOperandText.count > CalculatorNameSpace.doubleTypeSignificantDigits {
            return false
        }
        return true
    }
        
    private func isValidFirstInputNonZero(inputText: String) -> Bool {
        guard operandsLabel.text == CalculatorNameSpace.singleZero else {
            return true
        }
        if inputText == CalculatorNameSpace.singleZero || inputText == CalculatorNameSpace.doubleZero {
            return false
        }
        return true
    }
    
    private func updateTemporaryOperandTextAndOperandsLabel(by inputText: String) {
        if operandsLabel.text == CalculatorNameSpace.singleZero {
            temporaryOperandText = inputText
            operandsLabel.text = temporaryOperandText
        }
    }
    
    private func appendNumberToDecimalPlace(by inputText: String) {
        if temporaryOperandText.last == "." {
            temporaryOperandText += inputText
            operandsLabel.text = temporaryOperandText
        }
    }
}
