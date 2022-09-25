//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var expression: String = ""
    
    @IBOutlet weak var operand: UILabel!
    @IBOutlet weak var `operator`: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func numberOnePressed(_ sender: UIButton) {
        updateOperandNumber(with: "1")
    }
    
    func updateOperandNumber(with number: String) {
        if operand.text == "0" {
            operand.text = number
        } else {
            if let operandText = operand.text {
                operand.text = operandText + number
            }
        }
    }
}

