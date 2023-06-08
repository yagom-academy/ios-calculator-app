//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operators: UILabel!
    @IBOutlet weak var operands: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operands.text = "0"
        operators.text = ""
    }

    @IBAction func tappedOperands(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
        }
        
        operands.text = operand
    }
    
    @IBAction func tappedOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        
        operators.text = `operator`
        
        
    }
    
    
}

