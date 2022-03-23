//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var calculationRecordStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    // MARK: - Property
    private var currentOperand: String = "0"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction
extension CalculatorViewController {
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetOperand()
    }
    
    @IBAction private func touchUpChangePlusMinusButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
        
        updateOperandLabel(with: operand)
    }
        
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        updateOperandLabel(by: dot)
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        
    }
}

// MARK: - Method
extension CalculatorViewController {
    private func updateOperandLabel(with operand: String) {
        guard currentOperand.count < 20 else {
            return
        }
        
        currentOperand += operand
        operandLabel.text = currentOperand.addCommaEveryThirdTime()
    }
    
    private func updateOperandLabel(by dot: String) {
        guard currentOperand.contains(dot) == false else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    private func resetOperand() {
        currentOperand = "0"
        operandLabel.text = "0"
    }
}
