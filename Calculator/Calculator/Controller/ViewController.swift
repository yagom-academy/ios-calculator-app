//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var inputLabelStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
    }

    @IBAction func tapNumpad(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text else {
            return
        }
        if inputNumberLabel.text == "0" {
            inputNumberLabel.text? = labelText
        } else {
            inputNumberLabel.text? += labelText
        }
    }
}

