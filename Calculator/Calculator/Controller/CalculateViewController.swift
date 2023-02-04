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
        guard let zeroPad = sender.currentTitle else { return }
        guard calculatorChecker.hasCurrentInput(enteringNumber) else { return }
        
        let addedEnteringNumber = enteringNumber.convertToDouble(appending: zeroPad)
        enteringNumber = numberFormatter.string(for: addedEnteringNumber) ?? Sign.zero
    }
    
    
    func addFormulaStackView(to: UIStackView, with currentOperatorText: String) {
        let formulaStackView = FormulaStackView()
        formulaStackView.addLabels([currentOperatorText, enteringNumber])
        calculatorStackView.addArrangedSubview(formulaStackView)
        calculatorScrollView.layoutIfNeeded()
        calculatorScrollView.scrollToBottom()
    }
}

