//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    
    var inputNumber: String?
    var inputOperator: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
        inputNumber = "0"
        inputOperator = ""
    }

    @IBAction func operandsInputButtonTapped(_ sender: UIButton) {
        guard let value = sender.currentTitle else { return }
        // 가독성 너무 문제인데..
        if inputNumber == "0", value == "0" {
            return
        } else if inputNumber == "0", value == "00" {
            return
        } else if inputNumber == "0", value == "." {
            inputNumber?.append(value)
        } else if inputNumber == "0" {
            inputNumber = value
        } else if inputNumber?.contains(".") == true, value == "."{
            return
        } else {
            inputNumber?.append(value)
        }
        
        inputNumberLabel.text = inputNumber
        
    }
    
    @IBAction func operatorsInputButtonTapped(_ sender: UIButton) {
        inputOperatorLabel.text = sender.currentTitle
    }
    
}

