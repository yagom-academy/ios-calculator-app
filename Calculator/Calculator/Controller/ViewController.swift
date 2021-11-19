//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var inputNumber = Number()
    @IBOutlet var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = inputNumber.value
    }

    @IBAction func touchNumberButton(_ sender: UIButton) {
        inputNumber.updateValue(with: sender.title(for: .normal)!)
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchCEbutton(_ sender: UIButton) {
        inputNumber.reset()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchToggleSignButton(_ sender: UIButton) {
        inputNumber.toggleSign()
        numberLabel.text = inputNumber.value
    }
    
}

