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
            enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
        }
    }
    private var calculationExpression: String = Sign.empty
    
    private let calculatorChecker = CalculatorChecker()
    
    private lazy var numberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let numberPad = sender.currentTitle else { return }
        guard calculatorChecker.hasCurrentInput(enteringNumber) else {
            enteringNumber = numberPad
            return
        }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: numberPad)
        enteringNumber = numberFormatter.string(for: addedEnteringNumber) ?? Sign.zero
    }
    
    @IBAction func operatorPadTapped(_ sender: UIButton) {
        guard let inputOperatorText = sender.currentTitle,
              let currentOperatorText = enteringOperatorLabel.text else { return }
        
        enteringOperatorLabel.text = inputOperatorText
        
        guard calculatorChecker.hasCurrentInput(enteringNumber) else {
            return
        }
        
        calculationExpression += (currentOperatorText + enteringNumber)
        addFormulaStackView(to: calculatorStackView, with: currentOperatorText)
        enteringNumber = Sign.empty
    }
    
    @IBAction func zeroPadTapped(_ sender: UIButton) {
        // Label이 0인데 0을 누르면 0이 나와야 함. 그외는 다 입력가능
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
    
    @IBAction func dotPadTapped(_ sender: UIButton) {
        guard !calculatorChecker.hasDot(enteringNumber) else { return }
        enteringNumber = calculatorChecker.appendingDot(enteringNumber)
    }
    
    @IBAction func calculatePadTapped(_ sender: UIButton) {
        // 계산의 경우 현재 들고있는 값과 연산자를 끝에 붙여서 함.
        guard let operatorText = enteringOperatorLabel.text else { return }
        calculationExpression += (operatorText + enteringNumber)
        
        calculatorChecker.calculate(with: calculationExpression)
        
    }
    
    
    
    func addFormulaStackView(to: UIStackView, with currentOperatorText: String) {
        let formulaStackView = FormulaStackView()
        formulaStackView.addLabels(
            [
                currentOperatorText,
                numberFormatter.string(for: enteringNumber.convertToDouble()) ?? Sign.zero
            ]
        )
        calculatorStackView.addArrangedSubview(formulaStackView)
        calculatorScrollView.layoutIfNeeded()
        calculatorScrollView.scrollToBottom()
    }
}

