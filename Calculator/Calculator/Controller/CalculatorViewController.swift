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
    
    private func bringCurrentOperandsLabelText() -> String {
        guard let currentLabel = operandsLabel.text else {
            return CalculatorNameSpace.emptyStateString
        }
        return currentLabel
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
        let currentLabel = bringCurrentOperandsLabelText()
        
        if currentLabel.contains(CalculatorNameSpace.singleDot) {
            temporaryOperandText += operandButtonLabelText
            operandsLabel.text = appendOperandsLabel(by: operandButtonLabelText)
            return
        }
        operandsLabel.text = numberFormatter(currentLabel: currentLabel, inputText: operandButtonLabelText)
    }
    
    @IBAction func didTapSingleDotButton(_ sender: UIButton) {
        guard let singleDotButtonLabelText = sender.titleLabel?.text else {
            return
        }
        guard hasNotIncludedSingleDot() else {
            return
        }
        var currentLabel = bringCurrentOperandsLabelText()
        
        if currentLabel == CalculatorNameSpace.singleZero {
            currentLabel += singleDotButtonLabelText
            temporaryOperandText = CalculatorNameSpace.singleZeroAndDot
            operandsLabel.text = currentLabel
            return
        }
        currentLabel += singleDotButtonLabelText
        temporaryOperandText += singleDotButtonLabelText
        operandsLabel.text = currentLabel
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
    
    private func numberFormatter(currentLabel: String, inputText: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        if currentLabel == CalculatorNameSpace.singleZero {
            return updateTemporaryOperandText(by: inputText)
        }
        temporaryOperandText += inputText
        return numberFormatter.string(for: Double(temporaryOperandText))
    }
    
    private func updateTemporaryOperandText(by inputText: String) -> String {
            temporaryOperandText = inputText
            return temporaryOperandText
    }
        
    private func appendOperandsLabel(by inputText: String) -> String {
        var currentLabel = bringCurrentOperandsLabelText()
        currentLabel.append(contentsOf: inputText)
        return currentLabel
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

