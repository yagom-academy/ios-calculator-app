//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formula: Formula?
    
    @IBOutlet weak private var enteredOperatorLabel: UILabel!
    @IBOutlet weak private var enteredNumberLabel: CalculatorNumberLabel!
    @IBOutlet private var operatorButtons: [UIButton]!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var doubleZeroButton: UIButton!
    @IBOutlet weak private var dotButton: UIButton!
    @IBOutlet weak var verticalFormulasStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpSignSwitchButton(sender: UIButton) {
        guard enteredNumberLabel.text != CalculatorText.zero else {
            return
        }
        enteredNumberLabel.switchSign()
    }
    
    @IBAction private func touchUpCEButton(sender: UIButton) {
        enteredNumberLabel.resetToZero()
        enteredNumberLabel.isResultOfFormula = false
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text,
              let number = sender.currentTitle else {
                  return
              }
        enterNumber(sender: sender,
                    current: text,
                    entered: number)
    }
    
    private func enterNumber(sender: UIButton, current text: String, entered operand: String) {
        if enteredNumberLabel.isZero {
            switch sender {
            case zeroButton, doubleZeroButton:
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
    
    @IBAction private func touchUpEqualButton(sender: UIButton) {
        guard enteredNumberLabel.isZero == false else {
            return
        }
        makeFormulaStackView()
    }
    
    private func makeFormulaStackView() {
        guard let operatorLabel = makeOperatorLabel(),
              let operandLabel = makeOperandLabel() else {
                  return
              }
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
        let formulaStackView: UIStackView = .init(arrangedSubviews: [operatorLabel, operandLabel])
        formulaStackView.spacing = CGFloat(CalculatorNumber.formulaStackViewSpacing)
        verticalFormulasStackView.addArrangedSubview(formulaStackView)
    }
    
    private func makeOperatorLabel() -> UILabel? {
        guard let text = enteredOperatorLabel.text else {
            return nil
        }
        let operatorLabel: UILabel = .init()
        operatorLabel.text = text
        operatorLabel.textColor = .white
        operatorLabel.font = .preferredFont(forTextStyle: .title3)
        return operatorLabel
    }
    
    private func makeOperandLabel() -> UILabel? {
        guard let number = enteredNumberLabel.text else {
            return nil
        }
        let operandLabel: UILabel = .init()
        operandLabel.text = number
        operandLabel.textColor = .white
        operandLabel.font = .preferredFont(forTextStyle: .title3)
        return operandLabel
    }
}

