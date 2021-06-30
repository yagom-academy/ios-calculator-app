//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var notation: [String] = []
    var inputNotation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notation = []
    }

    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandButtonNumber = sender.titleLabel?.text else {
            return
        }
        
        inputNotation = "\(inputNotation)\(operandButtonNumber)"
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operatorCase = sender.titleLabel?.text else {
            return
        }
        notation.append(inputNotation)
        notation.append(operatorCase)
        inputNotation = ""
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        
    }
}

