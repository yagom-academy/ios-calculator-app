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
    @IBOutlet weak var formulaScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToInitialState()
    }
    
    @IBAction private func setToInitialState() {
        verticalFormulasStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        enteredOperatorLabel.text = nil
        enteredNumberLabel.resetToZero()
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
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard !enteredNumberLabel.isZero else {
            enteredOperatorLabel.text = sender.currentTitle
            return
        }
        makeFormulaStackView()
        enteredOperatorLabel.text = sender.currentTitle
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
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let bottomPoint: CGPoint = .init(x: 0, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(bottomPoint, animated: false)
    }
    
    private func makeOperatorLabel() -> UILabel? {
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
    
    @IBAction private func touchUpEqualButton(sender: UIButton) {
        
    }
}

