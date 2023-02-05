//
//  Calculator - CalculateViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var enteringNumberLabel: UILabel!
    @IBOutlet weak var enteringOperatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    
    private var enteringNumber: String = Sign.empty {
        didSet {
            if enteringNumber == Sign.empty || enteringNumber == Sign.space {
                enteringNumberLabel.text = Sign.zero
            } else {
                enteringNumberLabel.text = enteringNumber
            }
        }
    }
    private var calculationExpression: String = Sign.empty
    
    private let calculatorChecker = CalculatorChecker()
    
    private lazy var numberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        guard let numberPad = sender.currentTitle else { return }
        guard calculatorChecker.hasCurrentInput(enteringNumber) else {
            enteringNumber = numberPad
            return
        }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: numberPad)
        enteringNumber = numberFormatter.string(for: addedEnteringNumber) ?? Sign.zero
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        guard let inputOperatorText = sender.currentTitle,
              let currentOperatorText = enteringOperatorLabel.text else { return }
        enteringOperatorLabel.text = inputOperatorText
        
        guard let enteringNumberText = enteringNumberLabel.text else { return }
        guard !enteringNumber.isEmpty else { return }
        
        calculationExpression += (currentOperatorText + enteringNumberText)
        addFormulaStackView(to: calculatorStackView, with: currentOperatorText)
        enteringNumber = Sign.empty
    }
    
    @IBAction private func zeroPadTapped(_ sender: UIButton) {
        guard let zeroPad = sender.currentTitle,
              let enteringNumberText = enteringNumberLabel.text,
                  !calculatorChecker.isZero(enteringNumberText) else {
            enteringNumber = Sign.zero
            return
        }
        guard !calculatorChecker.hasDot(enteringNumber) else {
            enteringNumber.append(zeroPad)
            return
        }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: zeroPad)
        enteringNumber = numberFormatter.string(for: addedEnteringNumber) ?? Sign.zero
    }
    
    @IBAction private func dotPadTapped(_ sender: UIButton) {
        guard let enteringNumberText = enteringNumberLabel.text,
            !calculatorChecker.hasDot(enteringNumberText) else { return }
        
        enteringNumber = calculatorChecker.appendingDot(enteringNumberText)
    }
    
    @IBAction private func calculatePadTapped(_ sender: UIButton) {
        guard let enteringOperatorText = enteringOperatorLabel.text,
              enteringOperatorText != Sign.empty,
              enteringNumber != Sign.space else { return }
        
        guard let operatorText = enteringOperatorLabel.text else { return }
        calculationExpression += (operatorText + enteringNumber)
        addFormulaStackView(to: calculatorStackView, with: operatorText)
        
        let result = calculatorChecker.calculate(with: calculationExpression)
        initialState()
        enteringNumberLabel.text = numberFormatter.string(for: result)
    }
    
    @IBAction private func ACPadTapped(_ sender: UIButton) {
        initialState()
        removeAllFormulaStackView()
    }
    
    @IBAction private func CEPadTapped(_ sender: UIButton) {
        enteringOperatorLabel.text = Sign.empty
        enteringNumber = Sign.empty
    }
    
    @IBAction private func changeSignPadTapped(_ sender: UIButton) {
        guard let enteringNumberText = enteringNumberLabel.text,
              !calculatorChecker.isZero(enteringNumberText) else { return }
        enteringNumber = calculatorChecker.changedSign(enteringNumberText)
    }
    
    private func addFormulaStackView(to: UIStackView, with currentOperatorText: String) {
        guard let enteringNumberText = enteringNumberLabel.text else { return }
        let formulaStackView = FormulaStackView()
        formulaStackView.addLabels(
            [
                currentOperatorText,
                numberFormatter.string(for: enteringNumberText.convertToDouble()) ?? Sign.zero
            ]
        )
        calculatorStackView.addArrangedSubview(formulaStackView)
        calculatorScrollView.layoutIfNeeded()
        calculatorScrollView.scrollToBottom()
    }
    
    private func initialState() {
        enteringNumber = Sign.space
        calculationExpression = Sign.empty
        enteringOperatorLabel.text = Sign.empty
    }
    
    private func removeAllFormulaStackView() {
        calculatorStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
