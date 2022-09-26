//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formula: Formula?

    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var enteredNumberLabel: CalculatorNumberLabel!
    @IBOutlet private var operators: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpSignSwitchButton(sender: UIButton) {
        guard enteredNumberLabel.text != "0" else {
            return
        }
        enteredNumberLabel.switchSign()
    }
}

