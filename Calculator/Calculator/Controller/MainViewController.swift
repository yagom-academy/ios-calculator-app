//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var zeroDouble: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
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

