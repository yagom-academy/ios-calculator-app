//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    private var currentNumber: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressNumbers(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case "0":
            currentNumber = number
        default:
            currentNumber += number
        }
        
        DispatchQueue.main.async {
            self.currentNumberLabel.text = self.currentNumber
        }
    }
}

