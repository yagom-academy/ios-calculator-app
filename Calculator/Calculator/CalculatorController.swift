//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {

    @IBOutlet weak private var numberLabel: UILabel!
    
    private var isDotExist: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeNumberLabel(text: String) {
        let currentText = numberLabel.text ?? "0"
        
        guard currentText != "0" ||
              text != "00" else {
                  return
        }
        
        if currentText == "0" {
            numberLabel.text = text
        } else {
            numberLabel.text = currentText + text
        }
    }
}

// MARK: - Button Event
extension CalculatorController {
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else { return }
        
        changeNumberLabel(text: operand)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if isDotExist == false {
            isDotExist = true
            
            let currentText = numberLabel.text ?? "0"
            guard let operand = sender.currentTitle else { return }
            
            numberLabel.text = currentText + operand
        }
    }
}
