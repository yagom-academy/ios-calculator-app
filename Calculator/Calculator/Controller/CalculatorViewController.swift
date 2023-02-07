//
//  Calculator - CalculateViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var enteringNumberLabel: UILabel!
    @IBOutlet weak var enteringOperatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: CalculatorStackView!
    
    private var calculatorChecker: CalculatorChecker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorChecker = CalculatorChecker(updateClosure: { text in
            self.enteringNumberLabel.text = text == Sign.empty ? Sign.zero : text
            
        })
        enteringNumberLabel.text = Sign.zero
        enteringOperatorLabel.text = Sign.empty
    }
    
    @IBAction func didTapNumberPad(_ sender: UIButton) {
        guard let numberPad = sender.currentTitle else { return }
        calculatorChecker?.appendingNumber(numberPad)
    }
    
    @IBAction private func didTapOperatorPad(_ sender: UIButton) {
        guard let inputOperatorText = sender.currentTitle,
              let currentOperatorText = enteringOperatorLabel.text else { return }
        enteringOperatorLabel.text = inputOperatorText
        
        guard enteringNumberLabel.text != Sign.zero,
              let formattingLabelText = enteringNumberLabel.text?.convertToDouble(),
              let decimalText = calculatorChecker?.convertToDecimal(for: formattingLabelText) else { return }
        calculatorStackView.addLabels(operandText: decimalText, operatorText: currentOperatorText)
        calculatorChecker?.appendingExpression(currentOperatorText)
    }
    
    @IBAction private func didTapZeroPad(_ sender: UIButton) {
        guard let zeroPad = sender.currentTitle else {
            return
        }
        
        calculatorChecker?.appendingZero(zeroPad)
    }

    @IBAction private func didTapDotPad(_ sender: UIButton) {
        calculatorChecker?.appendingDot()
    }
//
//    @IBAction private func didTapCalculationPad(_ sender: UIButton) {
//        guard let enteringOperatorText = enteringOperatorLabel.text,
//              enteringOperatorText != Sign.empty,
//              enteringNumber != Sign.space else { return }
//
//        guard let operatorText = enteringOperatorLabel.text,
//              let enteringNumberText = enteringNumberLabel.text  else { return }
//        calculationExpression += (operatorText + enteringNumberText)
//        addFormulaStackView(to: calculatorStackView, with: operatorText)
//
//        let result = calculatorChecker.calculate(with: calculationExpression)
//        initialState()
//        enteringNumberLabel.text = convertToDecimal(for: result)
//    }
//
//    @IBAction private func didTapACPad(_ sender: UIButton) {
//        initialState()
//        removeAllFormulaStackView()
//    }
//
//    @IBAction private func didTapCEPad(_ sender: UIButton) {
//        enteringOperatorLabel.text = Sign.empty
//        enteringNumber = Sign.empty
//    }
//
//    @IBAction private func didTapChangedSighPad(_ sender: UIButton) {
//        guard let enteringNumberText = enteringNumberLabel.text,
//              !calculatorChecker.isZero(enteringNumberText) else { return }
//        enteringNumber = calculatorChecker.changedSign(enteringNumberText)
//    }
//
//    private func addFormulaStackView(to: UIStackView, with currentOperatorText: String) {
//        guard let enteringNumberText = enteringNumberLabel.text,
//                  calculatorChecker.hasCurrentInput(enteringNumber) else { return }
//        let formulaStackView = FormulaStackView()
//        formulaStackView.addLabels(
//            [
//                currentOperatorText,
//                convertToDecimal(for: enteringNumberText.convertToDouble())
//            ]
//        )
//        calculatorStackView.addArrangedSubview(formulaStackView)
//        calculatorScrollView.layoutIfNeeded()
//        calculatorScrollView.scrollToBottom()
//    }
//
//    private func initialState() {
//        enteringNumber = Sign.space
//        calculationExpression = Sign.empty
//        enteringOperatorLabel.text = Sign.empty
//    }
//
//    private func removeAllFormulaStackView() {
//        calculatorStackView.subviews.forEach {
//            $0.removeFromSuperview()
//        }
//    }
}
