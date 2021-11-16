//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard let txt = operandLabel.text else {
            return
        }
        
        guard let a = sender.titleLabel?.text else {
            return
        }
        
        if txt == "0" {
            if a == "0" || a == "00" {
                return
            }
        }
        
        operandLabel.text = txt + a
        
    }
}

