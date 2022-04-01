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
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCalculatorHistory()
    }
    
    @IBAction func didTapAllClearButton(_ sender: UIButton) {
        initializeCalculatorHistory()
    }
    
    @IBAction func didTapClearEntryButton(_ sender: UIButton) {
        temporaryOperandText = CalculatorNameSpace.singleZero
        operandsLabel.text = CalculatorNameSpace.singleZero
    }
    
    @IBAction func didTapPositiveNegativeConversionButton(_ sender: UIButton) {
        guard var operandsLabelText = operandsLabel.text else {
            return
        }
        if temporaryOperandText == CalculatorNameSpace.singleZero {
            return
        }
        if temporaryOperandText.hasPrefix(CalculatorNameSpace.negativeSign) {
            temporaryOperandText.removeFirst()
            operandsLabelText.removeFirst()
            operandsLabel.text = operandsLabelText
            return
        }
        temporaryOperandText = CalculatorNameSpace.negativeSign + temporaryOperandText
        operandsLabel.text = CalculatorNameSpace.negativeSign + operandsLabelText
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
        operandsLabel.text = validateTemporaryOperandTextConditionAndChangeValue(by: operandButtonLabelText)
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
        temporaryOperandText += operandButtonLabelText
        operandsLabel.text = operandsLabelText + operandButtonLabelText
    }
    
    @IBAction func didTapOperatorButtons(_ sender: UIButton) {
        guard let operatorButtonLabelText = sender.titleLabel?.text else {
            return
        }
        guard let currentOperatorsLabel = operatorsLabel.text else {
            return
        }
        guard let currentOperandsLabel = operandsLabel.text else {
            return
        }
        if temporaryOperandText == CalculatorNameSpace.singleZero {
            return
        }
        appendArrangedStackView(operandText: currentOperandsLabel, operatorText: currentOperatorsLabel)
        scrollView.scrollToBottom()
        confirmedFormula.append(temporaryOperandText)
        confirmedFormula.append(operatorButtonLabelText)
        temporaryOperandText = CalculatorNameSpace.singleZero
        operandsLabel.text = CalculatorNameSpace.singleZero
        operatorsLabel.text = operatorButtonLabelText
    }
}

// MARK: - didTapAllClearButton 관련 메서드

extension CalculatorViewController {
    private func initializeCalculatorHistory() {
        operandsLabel.text = CalculatorNameSpace.singleZero
        operatorsLabel.text = CalculatorNameSpace.emptyStateString
        temporaryOperandText = CalculatorNameSpace.singleZero
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
        return numberFormatter.string(for: Double(inputText))
    }
    
    private func validateTemporaryOperandTextConditionAndChangeValue(by inputText: String) -> String? {
        if operandsLabel.text == CalculatorNameSpace.singleZero {
            return updateTemporaryOperandText(by: inputText)
        }
        if temporaryOperandText.contains(CalculatorNameSpace.singleDot) &&
            (inputText == CalculatorNameSpace.singleZero || inputText == CalculatorNameSpace.doubleZero) {
            temporaryOperandText = appendTemporaryOperandText(by: inputText)
            let operandsLabelText = operandsLabel.text ?? CalculatorNameSpace.singleZero
            return operandsLabelText + inputText
        }
        if temporaryOperandText.contains(CalculatorNameSpace.singleDot) {
            let result = appendTemporaryOperandText(by: inputText)
            return numberFormatter(by: result)
        }
        temporaryOperandText += inputText
        return numberFormatter(by: temporaryOperandText)
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


// MARK: - stackView 관련 메서드

extension CalculatorViewController {
    private func appendArrangedStackView(operandText: String?, operatorText: String?) {
        let stackViewOperandLabel: UILabel = {
            let label = UILabel()
            label.text = operandText
            label.textColor = .white
            return label
        }()
        let stackViewOperatorLabel: UILabel = {
            let label = UILabel()
            label.text = operatorText
            label.textColor = .white
            return label
        }()
        let stackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [stackViewOperatorLabel, stackViewOperandLabel])
            view.axis = .horizontal
            view.distribution = .fill
            view.spacing = 8
            return view
        }()
        verticalStackView.addArrangedSubview(stackView)
    }
}
