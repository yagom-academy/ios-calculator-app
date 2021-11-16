//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistory: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else {
            return
        }
        
        guard let tapedNumber = sender.titleLabel?.text else {
            return
        }
        
        if operandLabelText == "0" {
            if tapedNumber == "0" || tapedNumber == "00" {
                return
            } else {
                operandLabel.text = tapedNumber
                return
            }
        }
        
        operandLabel.text = operandLabelText + tapedNumber
        
    }
    
    func reset() {
        operandLabel.text = "0"
        operatorLabel.text = ""
        allClear()
    }
}

