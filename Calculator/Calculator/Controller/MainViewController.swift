//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    enum Condition {
        static let zero = "0"
        static let zeroTwice = "00"
        static let empty = ""
        static let minus = "-"
    }
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLabels()
    }
    
    private func initializeLabels() {
        self.operandLabel.text = Condition.zero
        self.operatorLabel.text = Condition.empty
    }
    
    @IBAction func makeOperand(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else { return }
        
        if let operand = operandLabel.text,
           operand != Condition.zero {
            operandLabel.text = operand + inputNumber
        } else if let operand = operandLabel.text,
                  operand == Condition.zero,
                  inputNumber != Condition.zero,
                  inputNumber != Condition.zeroTwice {
            operandLabel.text = inputNumber
        }
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Condition.zero
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        guard let operandText = operandLabel.text,
              operandText != Condition.zero,
              let currentOperand = Double(operandText) else { return }
        
        operandLabel.text = String(-currentOperand)
    }
    
    @IBAction func presentOperator(_ sender: UIButton) {
        guard let inputOperator = sender.titleLabel?.text else { return }
        
        operatorLabel.text = inputOperator
    }
}

