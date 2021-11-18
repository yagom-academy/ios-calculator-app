//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var currentInputOperand: String = "0"
    var currentInputOperator: String = ""
    var mathExpression: [String] = []
    var isEvaluated: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func resetExpression() {
        currentInputOperand = "0"
        currentInputOperator = ""
        mathExpression = []
        isEvaluated = false
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        if isEvaluated { return }
        
        if currentInputOperand == "0" {
           currentInputOperand = number
            return
        }
        
        currentInputOperand += number
    }


}

