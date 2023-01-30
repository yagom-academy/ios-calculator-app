//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLabels()
    }
    
    private func initializeLabels() {
        self.operandLabel.text = "0"
        self.operatorLabel.text = ""
    }
    
    @IBAction func addNumber(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else { return }
        
        if let operand = operandLabel.text,
           operand != "0" {
            operandLabel.text = operand + inputNumber
        } else if let operand = operandLabel.text,
                  operand == "0",
                  inputNumber != "0",
                  inputNumber != "00" {
            operandLabel.text = inputNumber
        }
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
}

