//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {
    @IBOutlet weak var operatorInput: UILabel!
    @IBOutlet weak var numberInput: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorInput.text = ""
        numberInput.text = "0"
    }
}

// MARK: - Actions

extension CalculatorVC {
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if numberInput.text == "0" {
            numberInput.text = ""
        }
        
        numberInput?.text! += sender.currentTitle!
    }
}

