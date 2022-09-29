//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private enum Constants {
        enum Number {
            static let maximumDigits: Int = 20
        }
        
        enum Text {
            static let zero: String = "0"
            static let doubleZero: String = "00"
            static let dot: String = "."
            static let nan: String = "NaN"
            static let reset: String = "리셋"
            static let cancel: String = "취소"
            static let resetSuggestion: String = " 리셋하시겠습니까?"
        }
    }
    
    private var formulaLog: [String?] = []
    private var isResultOfFormula: Bool = false
    private var isInputtedZero: Bool = false
    private var isFirstNumberOfCalculator: Bool = true
    
    @IBOutlet weak private var enteredOperatorLabel: UILabel!
    @IBOutlet weak private var enteredNumberLabel: CalculatorNumberLabel!
    @IBOutlet private var operatorButtons: [UIButton]!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var doubleZeroButton: UIButton!
    @IBOutlet weak private var dotButton: UIButton!
    @IBOutlet weak private var verticalFormulaStackView: UIStackView!
    @IBOutlet weak private var formulaScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialState()
    }
    
    private func configureInitialState() {
        verticalFormulaStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
    }
    
    @IBAction private func resetToInitialState() {
        configureInitialState()
        isResultOfFormula = false
        isFirstNumberOfCalculator = true
        formulaLog = []
    }
    
    @IBAction private func touchUpSignSwitchButton(sender: UIButton) {
        guard !isResultOfFormula || enteredNumberLabel.text != Constants.Text.zero else { return }
        enteredNumberLabel.switchSign()
    }
    
    @IBAction private func touchUpCEButton(sender: UIButton) {
        enteredNumberLabel.resetToZero()
        isResultOfFormula = false
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text,
              let number = sender.currentTitle,
              !isResultOfFormula else { return }
        enterNumber(sender: sender, current: text, entered: number)
    }
    
    private func enterNumber(sender: UIButton, current text: String, entered operand: String) {
        if enteredNumberLabel.isZero {
            enteredNumberLabel.text = operand
        } else {
            enteredNumberLabel.text = text + operand
        }
    }
    
    @IBAction private func touchUpZeroButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text, !isResultOfFormula else { return }
        enterZero(current: text)
    }
    
    private func enterZero(current text: String) {
        if enteredNumberLabel.isZero {
            isInputtedZero = true
        } else {
            enteredNumberLabel.text = text + Constants.Text.zero
        }
    }
    
    @IBAction private func touchUpDoubleZeroButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text, !isResultOfFormula else { return }
        enterDoubleZero(current: text)
    }
    
    private func enterDoubleZero(current text: String) {
        if !enteredNumberLabel.isZero {
            enteredNumberLabel.text = text + Constants.Text.doubleZero
        }
    }
    
    @IBAction private func touchUpDotButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text, !isResultOfFormula else { return }
        enterDot(current: text)
    }
    
    private func enterDot(current text: String) {
        if !text.contains(Constants.Text.dot) {
            enteredNumberLabel.text = text + Constants.Text.dot
        }
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard !isResultOfFormula else { return }
        if enteredNumberLabel.isZero, isInputtedZero {
            enteredOperatorLabel.text = sender.currentTitle
            return
        }
        makeFormulaStackView()
        enteredOperatorLabel.text = sender.currentTitle
    }
    
    private func makeFormulaStackView() {
        guard canMakingFormulaStackView() else { return }
        let formulaStackView: FormulaStackView = .init()
        formulaStackView.configure(operatorText: enteredOperatorLabel.text,
                                   operandText: enteredNumberLabel.text)
        appendToFormulaLog()
        verticalFormulaStackView.addArrangedSubview(formulaStackView)
        scrollToBottom()
    }
    
    private func canMakingFormulaStackView() -> Bool {
        if enteredOperatorLabel.text == nil, !isFirstNumberOfCalculator {
            return false
        }
        return true
    }
    
    private func appendToFormulaLog() {
        formulaLog.append(contentsOf: [enteredOperatorLabel.text, enteredNumberLabel.text])
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
    }
    
    private func scrollToBottom() {
        let bottomPoint: CGPoint = .init(x: .zero, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(bottomPoint, animated: false)
    }
    
    @IBAction private func touchUpEqualButton(sender: UIButton) {
        guard !isResultOfFormula else { return }
        if enteredNumberLabel.isZero, !isInputtedZero {
            enteredOperatorLabel.text = nil
        } else {
            makeFormulaStackView()
        }
        let formula: Formula = ExpressionParser.parse(from: formulaLog.compactMap({ $0 }).joined())
        calculate(formula)
    }
    
    private func calculate(_ formula: Formula) {
        var formula: Formula = formula
        do {
            let result = try String(formula.result())
            makeResultOfFormula(text: result)
        } catch FormulaError.divideByZero {
            enteredNumberLabel.text = Constants.Text.nan
            return
        } catch {
            showErrorAlert(message: error.localizedDescription + Constants.Text.resetSuggestion)
        }
    }
    
    private func makeResultOfFormula(text: String) {
        enteredNumberLabel.text = text
        isResultOfFormula = true
        enteredNumberLabel.text = formatCalculatedResult()
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let resetAction = UIAlertAction(title: Constants.Text.reset,
                                        style: .default) { (action) in
            self.resetToInitialState()
        }
        let cancelAction = UIAlertAction(title: Constants.Text.cancel,
                                         style: .default)
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    private func formatCalculatedResult() -> String? {
        let numberFormatter: NumberFormatter = numberFormatter()
        guard let text = enteredNumberLabel.text,
              let number = Double(text),
              let formattedNumber: String = numberFormatter.string(from: NSNumber(value: number)) else {
                  return nil
              }
        return formattedNumber
    }
    
    private func numberFormatter() -> NumberFormatter {
        let numberFormatter: NumberFormatter = .init()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = Constants.Number.maximumDigits
        return numberFormatter
    }
}

