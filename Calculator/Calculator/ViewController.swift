//
//  Calculator - ViewController.swift
//  Created by sehong.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var calculateItemStackView: CalculateItemStackView!
    @IBOutlet private var calculateItemScrollView: CalculateItemScrollView!
    
    private var inputHandler = InputHandler()
    private let numberFormatter = NumberFormatter(numberStyle: .decimal,
                                                  roundingMode: .halfUp,
                                                  usesSignificantDigits: true,
                                                  maximumSignificantDigits: 20)
    private var currentOperand: String {
        return operandLabel.text ?? Sign.zero
    }
    private var currentOperator: String {
        return operatorLabel.text ?? Sign.empty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialCurrentCalculateItem()
        setInitialCalculateItemStackView()
    }
    
    private func setInitialCurrentCalculateItem() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
    }
    
    private func setInitialCalculateItemStackView() {
        calculateItemStackView.removeAllSubviews()
    }
    
    @IBAction private func touchOperandButton(_ sender: UIButton) {
        guard let inputOperand = sender.currentTitle else { return }
        
        if currentOperand != Sign.zero {
            let nextOperand = currentOperand + inputOperand
            operandLabel.text = numberFormatter.convertToDecimal(from: nextOperand)
        } else {
            operandLabel.text = inputOperand
        }
    }
}
