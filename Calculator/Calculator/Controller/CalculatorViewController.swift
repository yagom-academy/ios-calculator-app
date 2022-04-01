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
    
    @IBAction func didTapAllClearButton(_ sender: UIButton) {
        initializeCalculatorHistory()
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
        operandsLabel.text = numberFormatter(by: operandButtonLabelText)
    }
    
    @IBAction func didTapSingleDotButton(_ sender: UIButton) {
        guard let operandButtonLabelText = sender.titleLabel?.text else {
            return
        }
        guard let operandsLabelText = operandsLabel.text else {
            return
        }
        guard hasNotIncludedSingleDot() else {
            return
        }
        temporaryOperandText = operandsLabelText
        operandsLabel.text = appendTemporaryOperandText(by: operandButtonLabelText)
    }
}

// MARK: - didTapAllClearButton 관련 메서드

extension CalculatorViewController {
    private func initializeCalculatorHistory() {
        operandsLabel.text = CalculatorNameSpace.singleZero
        operatorsLabel.text = CalculatorNameSpace.emptyStateString
        temporaryOperandText = CalculatorNameSpace.emptyStateString
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
    
    private func numberFormatter(by inputText: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        if operandsLabel.text == CalculatorNameSpace.singleZero {
            return updateTemporaryOperandText(by: inputText)
        }
        if temporaryOperandText.contains(CalculatorNameSpace.singleDot) {
            return appendTemporaryOperandText(by: inputText)
        }
        temporaryOperandText += inputText
        return numberFormatter.string(for: Double(temporaryOperandText))
    }
    
    private func updateTemporaryOperandText(by inputText: String) -> String {
            temporaryOperandText = inputText
            return temporaryOperandText
    }
    
    private func appendTemporaryOperandText(by inputText: String) -> String {
            temporaryOperandText += inputText
            return temporaryOperandText
    }
}

// MARK: - didTapSingleDotButton 관련 메서드

extension CalculatorViewController {
    private func hasNotIncludedSingleDot() -> Bool {
        if temporaryOperandText.contains(CalculatorNameSpace.singleDot) {
            return false
        }
        return true
    }
}
