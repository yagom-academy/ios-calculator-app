//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func numberButtonPressed(_ sender: UIButton) {
        guard let senderLabel = sender.titleLabel,
              let senderText = senderLabel.text
        else { return }
        updateOperandLabel(with: senderText)
    }
    
    private func updateOperandLabel(with number: String) {
        
        if operandLabel.isZero {
            operandLabel.text = number
        } else {
            if let operandText = operandLabel.text {
                operandLabel.text = operandText + number
            }
        }
    }
}

