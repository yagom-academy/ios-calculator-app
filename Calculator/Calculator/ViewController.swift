//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBAction func inputOperand(_ sender: UIButton) {
        if operandLabel.text == "0" && sender.currentTitle != "." { operandLabel.text = "" }
        guard let text = operandLabel.text, let inputText = sender.currentTitle else { return }
        operandLabel.text = text + inputText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }


}

