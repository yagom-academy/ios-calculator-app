//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private enum CalculatorNumber {
        static let formulaStackViewSpacing: Int = 8
        static let maximumDigits: Int = 20
    }
    
    var formulaLog: [String?] = []
    var isResultOfFormula: Bool = false
    var isInputtedZero: Bool = false
    var isFirstNumberOfCalculator: Bool = true
    
    @IBOutlet weak private var enteredOperatorLabel: UILabel!
    @IBOutlet weak private var enteredNumberLabel: CalculatorNumberLabel!
    @IBOutlet private var operatorButtons: [UIButton]!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var doubleZeroButton: UIButton!
    @IBOutlet weak private var dotButton: UIButton!
    @IBOutlet weak private var verticalFormulasStackView: UIStackView!
    @IBOutlet weak private var formulaScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configToInitialState()
    }
    
    @IBAction private func configToInitialState() {
        verticalFormulasStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
        self.isResultOfFormula = false
        formulaLog = []
    }
    
    @IBAction private func touchUpSignSwitchButton(sender: UIButton) {
        guard !self.isResultOfFormula else {
            return
        }
        guard enteredNumberLabel.text != CalculatorText.zero else {
            return
        }
        enteredNumberLabel.switchSign()
    }
    
    @IBAction private func touchUpCEButton(sender: UIButton) {
        enteredNumberLabel.resetToZero()
        self.isResultOfFormula = false
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text,
              let number = sender.currentTitle,
        !self.isResultOfFormula else {
            return
        }
        enterNumber(sender: sender,
                    current: text,
                    entered: number)
    }
    
    private func enterNumber(sender: UIButton, current text: String, entered operand: String) {
        if enteredNumberLabel.isZero {
            switch sender {
            case zeroButton:
                self.isInputtedZero = true
            case doubleZeroButton:
                return
            case dotButton:
                enteredNumberLabel.text = text + operand
            default:
                enteredNumberLabel.text = operand
            }
        } else {
            if sender == dotButton,
               text.contains(CalculatorText.dot) {
                return
            } else {
                enteredNumberLabel.text = text + operand
            }
        }
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard !self.isResultOfFormula else {
            return
        }
        if enteredNumberLabel.isZero {
            if !self.isInputtedZero {
                enteredOperatorLabel.text = sender.currentTitle
                return
            }
        }
        makeFormulaStackView()
        enteredOperatorLabel.text = sender.currentTitle
    }
    
    private func makeFormulaStackView() {
        guard let operatorLabel = makeOperatorLabel(),
              let operandLabel = makeOperandLabel() else {
                  return
              }
        if isFirstNumberOfCalculator {
            isFirstNumberOfCalculator = false
        }
        formulaLog.append(contentsOf: [operatorLabel.text, operandLabel.text])
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
        let formulaStackView: UIStackView = .init(arrangedSubviews: [operatorLabel, operandLabel])
        formulaStackView.spacing = CGFloat(CalculatorNumber.formulaStackViewSpacing)
        verticalFormulasStackView.addArrangedSubview(formulaStackView)
        scrollToBottom()
    }
    
    private func makeOperatorLabel() -> UILabel? {
        if enteredOperatorLabel.text == nil {
            if !isFirstNumberOfCalculator {
                return nil
            }
        }
        let operatorLabel: UILabel = .init()
        operatorLabel.text = enteredOperatorLabel.text
        operatorLabel.textColor = .white
        operatorLabel.font = .preferredFont(forTextStyle: .title3)
        return operatorLabel
    }
    
    private func makeOperandLabel() -> UILabel? {
        let operandLabel: UILabel = .init()
        operandLabel.text = enteredNumberLabel.text
        operandLabel.textColor = .white
        operandLabel.font = .preferredFont(forTextStyle: .title3)
        return operandLabel
    }
    
    private func scrollToBottom() {
        let bottomPoint: CGPoint = .init(x: .zero, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(bottomPoint, animated: false)
    }
    
    @IBAction private func touchUpEqualButton(sender: UIButton) {
        guard !self.isResultOfFormula else {
            return
        }
        if enteredNumberLabel.isZero,
           !self.isInputtedZero {
            enteredOperatorLabel.text = nil
        } else {
            makeFormulaStackView()
        }
        var formula: Formula = ExpressionParser.parse(from: formulaLog.compactMap({ $0 }).joined())
        var result: String = .init()
        do {
            result = try String(formula.result())
        } catch FormulaError.divideByZero {
            enteredNumberLabel.text = CalculatorText.nan
            return
        } catch {
            showErrorAlert(message: error.localizedDescription + CalculatorText.resetSuggestion)
        }
        makeResultOfFormula(text: result)
    }
    
    private func makeResultOfFormula(text: String) {
        enteredNumberLabel.text = text
        self.isResultOfFormula = true
        enteredNumberLabel.text = formatNumber()
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let resetAction = UIAlertAction(title: CalculatorText.reset,
                                        style: .default) { (action) in
            self.configToInitialState()
        }
        let cancelAction = UIAlertAction(title: CalculatorText.cancel,
                                         style: .default)
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    private func formatNumber() -> String? {
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
        numberFormatter.maximumSignificantDigits = CalculatorNumber.maximumDigits
        return numberFormatter
    }
}

